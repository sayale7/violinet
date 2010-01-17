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

      def tag_checklist_to_add(collection)  
        selected ||= []

        ERB.new(%{
          <% for item in collection %>
          <%= check_box_tag('tags[]', item.id) %><%= item.tag_names.find_by_language(I18n.locale.to_s).name %><br/>
          <% end %>
          }).result(binding)
        end
  
  
  def is_friend_of_current(user_id)
    if Friendship.find_by_friend_id_and_user_id(user_id, current_user.id).nil?
      return false
    else
      return true
    end
  end

  def recipients
    users = User.all(:joins  => :user_common, :conditions => "login LIKE '%#{params[:q]}%' or firstname LIKE '%#{params[:q]}%' or lastname LIKE '%#{params[:q]}%'") 
    friends = Array.new 
    users.each do |user|
      unless is_friend_of_current(user.id) 
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

  def accepted_friendship(me, my_friendship)
    is_friend = false
    my_friendship.friend.friendships.each do |inverse_friendship|
      if inverse_friendship.friend_id.to_s.eql?(me.id.to_s)
        is_friend = true
      end
    end
    return is_friend
  end

  def is_not_in_request_for_friendship(user)
    current_user.friendships.each do |friendship|
      if friendship.friend_id.to_s.eql?(user.id.to_s)
        return false
      else
        return true
      end
    end
  end

  def friendship_requests
    friends_to_accept = Array.new
    all_friendships_im_a_friend = Friendship.find_all_by_friend_id(current_user.id)
    all_friendships_im_a_friend.each do |friendship|
      if Friendship.find_by_friend_id_and_user_id(friendship.user_id, current_user.id).nil?
        friends_to_accept.push(User.find(friendship.user_id))
      end
    end
    return friends_to_accept
  end

  private

  # def for_every_user_im_a_friend_of(friend, me)
  #   friend.friendships.each do |friendship|
  #     if friendship.friend_id.to_s.eql?(me.id.to_s)
  #       look_if_he_is_a_friend_of_me(friend, me)
  #     end
  #   end
  # end
  # 
  # def look_if_he_is_a_friend_of_me(friend, me)
  #   if me.friendships.empty?
  #     @friends_to_accept.push(friend)
  #   else
  #     me.friendships.each do |my_friendship|
  #       if my_friendship.friend_id.to_s.eql?(friend.id.to_s)
  #         @friends_to_accept.push(friend)
  #       end
  #     end
  #   end
  # end
  
end