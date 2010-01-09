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
end
#<%= item.tag_names.find_by_language(I18n.locale.to_s).name %><br/>