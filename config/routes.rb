ActionController::Routing::Routes.draw do |map|
  map.resources :assigns

  
  map.resources :usergroups

  map.resources :groups

  map.resources :friendships

  map.resources :groups

  map.resources :all_users
  
  map.resources :tags
  
  map.resources :roles_users
  
  map.resources :roles
  
  map.resources :user_commons
  
  map.resources :profile_images
  
  map.resources :posts, :has_many  => :comments
  
  map.resources :users, :has_many  => :comments 
  
  map.resources :posts, :has_many  => :taggings
  
  map.resources :groups, :has_many  => :taggings
  
  map.resources :photo_albums
  
  map.resources :events
  
  map.resources :sent
  
  map.resources :messages, :member => { :reply => :get, :forward => :get, :reply_all => :get, :undelete => :put }
  
  map.resource :user_session
  
  # Added custom post action (swfupload) to the photo resource
  map.resources :photos, :collection => { :swfupload => :post }
  
  map.resources :users, :has_many  => :posts
  
  map.resources :users, :has_many  => :groups
  
  map.resources :users, :has_many  => :photo_albums
  
  map.resource :personals, :controller => "user_commons"
  

  # mappings for authlogic
  
  map.inbox 'inbox', :controller => "mailbox", :action => "index"
  
  map.trash_in 'trash_in', :controller => "mailbox", :action => "trash", :box => "in"
  
  map.trash_out 'trash_out', :controller => "mailbox", :action => "trash", :box => "out"
  
  
  
  # mappings for register users
  map.edit_account "edit_account", :controller => "users", :action => "edit"

  
  # for account activation
  map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
  
  map.activate '/activate/:id', :controller => 'activations', :action => 'create'
  
  # for account activation
  map.password_resets '/password_resets/', :controller => 'password_resets', :action => 'create'
  
  map.edit_password_reset '/edit_password_reset/:reset_code', :controller => 'password_resets', :action => 'edit'
  
  map.password_reset '/password_reset/:id', :controller => 'password_resets', :action => 'update'
  
  # for posts and comments
  map.login "login", :controller => "user_sessions", :action => "new"
  
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  
  map.myblog "myblog", :controller => "posts", :action => "myblog"
  
  map.mygroups "mygroups", :controller => "groups", :action => "mygroups"
  
  
  
  map.calendar "/calendar/:year/:month", :controller => "calendar", :action => "index", :year => Time.now.year, :month => Time.now.month
  
  map.destroy_friendship 'destroy_friendship', :controller => 'friendships', :action  => 'destroy'
  map.add_friendship 'add_friendship', :controller => 'friendships', :action  => 'create'
  
  map.user_search 'user_search', :controller  => 'users', :action  => 'index'
  
  map.post_search 'post_search', :controller  => 'posts', :action  => 'index'
  
  map.my_post_search 'my_post_search', :controller  => 'posts', :action  => 'myblog'
  
  map.group_search 'group_search', :controller  => 'groups', :action  => 'index'
  
  map.my_group_search 'my_group_search', :controller  => 'groups', :action  => 'mygroups'
  
  map.add_usergroup 'add_usergroup', :controller  => 'usergroups', :action  => 'create'
  
  map.destroy_usergroup 'destroy_usergroup', :controller  => 'usergroups', :action  => 'destroy'
  
  map.manage_tags 'manage_tags', :controller  => 'tags', :action  => 'manage_tags'
  
  map.manage_categories 'manage_categories', :controller  => 'tags', :action  => 'manage_categories'
  
  map.services 'services', :controller  => 'services'
  
  map.resources :users, :has_many => :assigns
  
  map.build_admin_values 'build_admin_values', :controller  => 'assigns', :action  => 'add_admin_assign_value'
  
  map.remove_admin_values 'remove_admin_values', :controller  => 'assigns', :action  => 'remove_admin_assign_value'
  
  map.set_user_assign_values 'set_user_assign_values', :controller  => 'assigns', :action  =>  'set_user_assign_values'
  
  map.root :controller => "welcome", :action => "index"
  

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
