# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def checklist(name, collection, value_method, display_method, selected)
     selected ||= []

     ERB.new(%{
     <div class="tb_mail">
       <% for item in collection %>
         <%= check_box_tag name, item.send(value_method), selected.include?(item.send(value_method)) %> <%=h item.send(display_method) %><br />
       <% end %>
     </div>}).result(binding)
   end
end
