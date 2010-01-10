ActionController::Routing::Routes.draw do |map|

  map.resources :categorytogroups

  map.resources :categories

  map.resources :user_to_groups

  map.resources :group_categories

  map.resources :groups

  map.resources :all_users
  
  map.resources :tags_posts
  
  map.resources :tags
  
  map.resources :roles_users
  
  map.resources :roles
  
  map.resources :user_commons
  
  map.resources :profile_images
  
  map.resources :posts, :has_many  => :comments
  
  map.resources :users, :has_many  => :comments
  
  # Added custom post action (swfupload) to the photo resource
  map.resources :photos, :collection => { :swfupload => :post }
  
  map.resources :photo_albums
  
  map.resources :events
  

  # mappings for authlogic
  map.resource :user_session
  #map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  
  map.resources :recipients
  
  map.inbox 'inbox', :controller => "mailbox", :action => "index"
  map.trash_in 'trash_in', :controller => "mailbox", :action => "trash", :box => "in"
  map.trash_out 'trash_out', :controller => "mailbox", :action => "trash", :box => "out"
  
  
  map.resources :sent
  #map.resources :mailbox, :collection => { :trash => :get }
  map.resources :messages, :member => { :reply => :get, :forward => :get, :reply_all => :get, :undelete => :put }
  
  # mappings for register users
  map.resource :account, :controller => "users"
  map.edit_account "edit_account", :controller => "users", :action => "edit"
  map.resources :users, :has_many => :profile_entries
  map.resource :personals, :controller => "user_commons"
  
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
  map.myblogarchiv "myblogarchiv", :controller => "posts", :action => "myblogarchiv"
  
  map.root :controller => "posts", :action => "index"
  
  map.calendar "/calendar/:year/:month", :controller => "calendar", :action => "index", :year => Time.now.year, :month => Time.now.month
  #map.calendar_export "/calendar/:year/:month", :controller => "calendar", :action => "index", :year => Time.now.year, :month => Time.now.month
  
  
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
