set :application, "abruzzoallstars"
set :repository,  "git://github.com/kennyadsl/aas.git"
set :domain, "abruzzoallstars.it"

# user is the login name for the shared hosting account
# it should also be the name of your home directory i.e. /home/my-user-name
set :user, "abruzzoa"

# this will place you app outside your /public_html
# and protect your app file from exposure
set :deploy_to, "/home/#{user}/#{application}"

set :scm, :git
# set :deploy_via, :remote_cache  # if your server has direct access to the repository
set :deploy_via, :copy  # if you server does NOT have direct access to the repository (default)
set :git_shallow_clone, 1  # only copy the most recent, not the entire repository (default:1)

ssh_options[:paranoid] = false
set :use_sudo, false

set :keep_releases, 2  # only keep a current and one previous version to save space

role :app, domain
role :web, domain
role :db,  domain, :primary => true

task :update_public, :roles => [:app] do
  run "chmod 755 #{release_path}/public"
  run "chmod 755 #{release_path}/public/dispatch.*"
end
# remove the .git directory and .gitignore from the current release
task :remove_git_directories, :roles => [:app] do
  run "rm -rfd #{release_path}/.git"
  run "rm #{release_path}/.gitignore"
end
# this lets us keep the system_stopped files in project
task :copy_system_stopped_files, :roles => [:app] do
  run "cp -f #{release_path}/public/system_stopped/* #{shared_path}/system_stopped/"
end

after "deploy:update_code", :update_public
after "deploy:update_code", :copy_system_stopped_files
after "deploy:update_code", :remove_git_directories

# create a symlink from the current/public to ~/public_html
task :create_public_html, :roles => [:app] do
  run "ln -fs #{current_path}/public ~/public_html"
end
after "deploy:cold", :create_public_html

# create a directory in shared to hold files that will be servered
# when the system is stopped, and a config directory
task :create_shared_directories, :roles => [:app] do
  run "mkdir -p #{shared_path}/system_stopped"
  run "mkdir -p #{shared_path}/config"
end
after "deploy:setup", :create_shared_directories

# remove the symlink for ~/public_html
task :remove_public_html, :roles => [:app] do
  run "rm ~/public_html"
end

# creates a symlink to ~/public_html to the shared/system_stopped directory
# places files you want served in this dir for when the system is stopped
task :create_public_html_to_stopped, :roles => [:app] do
  run "ln -fs #{shared_path}/system_stopped ~/public_html"
end

# we need to override the default start/stop/restart functions
namespace :deploy do
  desc "Restart the web server. Killing all FCGI processes."
  task :restart, :roles => :app do
    # for most hosts, all you need to do is stop all FCGI processing running
    run "killall -q dispatch.fcgi"
    # but some hosts can restart by touching the dispatch file
    #run "chmod 755 #{current_path}/public/dispatch.fcgi"
    #run "touch #{current_path}/public/dispatch.fcgi"
  end

  desc "Start the web server. Really nothing to do for shared hosting."
  task :start, :roles => :app do
    remove_public_html
    create_public_html
    deploy.restart
  end

  desc "Stop the web server and present maintenance page."
  task :stop, :roles => :app do
    remove_public_html
    create_public_html_to_stopped
  end

  namespace :web do
    desc "Make application web accessible again."
    task :enable, :roles => [:app] do
      deploy.start
    end

    desc "Present system maintenance page to users."
    task :disable, :roles => [:app] do
      deploy.stop
    end

  end
end