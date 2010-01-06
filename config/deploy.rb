set :application, "violinet"
set :deploy_to, "/var/rails/#{application}"
#############################################################
# Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, true

#############################################################
# Servers
#############################################################

set :user, "root"
set :domain, "92.51.146.57"
server domain, :app, :web
role :db, domain, :primary => true
set :runner, "root"

#############################################################
# SVN
#############################################################

set :repository,  "svn://kohler-it.net/svn/violinet/trunk/"
set :svn_username, "thomas"
set :svn_password, "aplhma6"
set :checkout, "export"

#############################################################
# Passenger
#############################################################

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

    [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end