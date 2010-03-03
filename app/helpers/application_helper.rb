# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def checklist(name, collection)
    selected ||= []

    ERB.new(%{
      <div class="tb_mail">
      <% collection.each { |key, value| %>
        <%= check_box_tag name, 1, value %> <%= User.find(key).login %><br/>
        <% } %>
        </div>}).result(binding)
      end

      def checklist_tag(collection)  
        selected ||= []

        ERB.new(%{
          <% for item in collection %>
          <%= check_box_tag('tags[]', item.id) %><%= item.tag_names.find_by_language(I18n.locale.to_s).name %><br/>
          <% end %>
          }).result(binding)
        end
      
  
        def admin_assign_values_checklist(collection, assign_id)  
          selected ||= []
          
          ERB.new(%{
            <% for item in collection %>
            <%= check_box_tag('user_assign_collection_#{assign_id}[]', item.id, is_checked?(item, assign_id)) %><%= item.name %><br/>
            <% end %>
            }).result(binding)
          end

          def is_checked?(item, assign_id)
            if(Assign.find(assign_id).assignable_type.to_s.eql?('User'))
              return !UserAssignValue.find_by_assignable_id_and_admin_assign_value_id_and_assign_id(current_user.id, item.admin_assign_value_id, assign_id).nil?
            end
            if(Assign.find(assign_id).assignable_type.to_s.eql?('Job'))
              if request.params[:action].to_s.eql?('new')
                return false
              else
                return !UserAssignValue.find_by_assignable_id_and_admin_assign_value_id_and_assign_id(request.params[:id], item.admin_assign_value_id, assign_id).nil?
              end
            end
          end
          
          
          
  def recipients
    users = User.all(:joins  => :user_common, :conditions => "login LIKE '%#{params[:q]}%' or firstname LIKE '%#{params[:q]}%' or lastname LIKE '%#{params[:q]}%'") 
    friends = Array.new 
    users.each do |user|
      if is_friend_of_current(user.id) 
        friends.push(user) 
      end 
    end 
    recipients = ""
    unless friends.empty? 
      recipients  = '[' 
      friends.each do |user| 
        full_name = user.user_common.firstname.to_s + " " + user.user_common.lastname.to_s 
        if full_name.gsub(" ", "").empty? 
          full_name << user.login 
        end 
        recipients << {'name'  => full_name , 'id'  => user.id}.to_json << ','
      end 
      recipients = recipients.slice(0, recipients.size - 1 )  
      recipients << ']' 
    end  
    return recipients
  end

  def is_friend_of_current(user_id)
    if Friendship.find_by_friend_id_and_user_id(user_id, current_user.id).nil?
      return false
    else
      return true
    end
  end
  
  def is_confirmed_friend_of_current(user_id)
    if Friendship.find_by_friend_id_and_user_id(current_user.id, user_id).nil?
      return false
    else
      return true
    end
  end

  def confirmed_friendships(user)
    return (user.friends & user.inverse_friends)
  end

  def is_not_in_request_for_friendship(user)
    no_friend = true
    current_user.friendships.each do |friendship|
      if friendship.friend_id.to_s.eql?(user.id.to_s)
        no_friend = false
      end
    end
    return no_friend
  end

  def friendship_requests
    return (current_user.inverse_friends - current_user.friends)
  end
  
  def inverse_friendship_requests
    return (current_user.friends - current_user.inverse_friends)
  end
  
  def is_member(group)
    return (User.find_all_by_id(current_user.id) & group.members).empty?
  end

  def unread_messages
    return MessageCopy.find_all_by_recipient_id_and_read_and_deleted(current_user.id, false, false)
  end
  
  def all_assigns(name)
    return Assign.find_all_by_assignable_type_and_parent_id(name, nil, :order => 'position')
  end

  def check_on_emptyness_of_children_through_privacy(user_id, assign_id, current_one)
    array = Array.new

    for assign_child in Assign.find_all_by_parent_id(assign_id, :order => 'position')
      unless UserAssignValue.find_all_by_assignable_id_and_assign_id(user_id, assign_child.id).empty?
        unless UserAssignValue.find_all_by_assignable_id_and_assign_id(user_id, assign_child.id).size == 1 && UserAssignValue.find_all_by_assignable_id_and_assign_id(user_id, assign_child.id).first.value.to_s.eql?('')
          if current_user && is_confirmed_friend_of_current(user_id) 
            array.push('element')
          end
          if current_user && !current_one && !is_confirmed_friend_of_current(user_id) && UserAssignValue.find_all_by_assignable_id_and_assign_id(user_id, assign_child.id).first.visible 
            array.push('element')
          end
          if !current_user && UserAssignValue.find_all_by_assignable_id_and_assign_id(user_id, assign_child.id).first.visible 
            array.push('element')
          end 
          if current_user && current_one 
            array.push('element')
          end 
        end
      end
    end
    
    return array.empty?
    
  end
  
  def root_tags(name)
    tags = Array.new
    Tag.find_all_by_taggable_type(name).each do |tag|
      if tag.parents.empty?
        tags.push(tag)
      end
    end
    return tags
  end
  
  def all_tags_without_deeply_nested(the_tag, taggable_type)
    end_tags = Array.new
    if !the_tag.parents.empty? || (the_tag.parents.empty? && the_tag.children.empty?)
      Tag.find_all_by_taggable_type(taggable_type.to_s).each do |tag|
        unless tag.parents.empty?
          tag.parents.each do |parent_tag|
            unless parent_tag.parents.empty?
              end_tags.push(tag)
            end
          end
        end
      end
      return (Tag.find_all_by_taggable_type(taggable_type.to_s) - end_tags - the_tag.to_a - the_tag.parents)
    else
      return end_tags
    end
  end
  
  def get_jobs_from_tags(job)
    jobs = Array.new
    job.tags.each do |tag|
      tag.taggings.each do |tagging|
        jobs.push(tagging.taggable)
      end
    end
    jobs = jobs.uniq - job.to_a
    return jobs
  end
  
  def get_active_jobs_from_tags(job)
    debugger
    jobs = Array.new
    job.tags.each do |tag|
      tag.taggings.each do |tagging|
        if tagging.taggable && tagging.taggable.active
          jobs.push(tagging.taggable)
        end
      end
    end
    jobs = jobs.uniq - job.to_a
    return jobs
  end
  
  def get_flats_from_tags(flat)
    flats = Array.new
    flat.tags.each do |tag|
      tag.taggings.each do |tagging|
        flats.push(tagging.taggable)
      end
    end
    flats = flats.uniq - flat.to_a
    return flats
  end
  
end