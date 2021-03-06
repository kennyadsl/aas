require 'bundler/capistrano'

# Necessary to run on Site5
set :use_sudo, false
set :group_writable, false
 
# Less releases, less space wasted
set :keep_releases, 2
 
# The mandatory stuff
set :application, "abruzzoallstars"
set :user, "abruzzoa"
 
set :repository, "git://github.com/kennyadsl/aas.git"

set :scm, :git
# set :deploy_via, :remote_cache  # if your server has direct access to the repository
set :deploy_via, :copy  # if you server does NOT have direct access to the repository (default)
set :git_shallow_clone, 1  # only copy the most recent, not the entire repository (default:1)
ssh_options[:paranoid] = false
set :use_sudo, false
set :keep_releases, 2  # only keep a current and one previous version to save space

# This is related to site5 too.
set :deploy_to, "/home/#{user}/apps/#{application}"
 
role :app, "abruzzoallstars.it"
role :web, "abruzzoallstars.it"
role :db,  "abruzzoallstars.it", :primary => true
 
 
# In the deploy namespace we override some default tasks and we define
# the site5 namespace.
namespace :deploy do
  desc <<-DESC
    Deploys and starts a `cold' application. This is useful if you have not \
    deployed your application before, or if your application is (for some \
    other reason) not currently running. It will deploy the code, run any \
    pending migrations, and then instead of invoking `deploy:restart', it will \
    invoke `deploy:start' to fire up the application servers.
  DESC
  # NOTE: we kill public_html so be sure to have a backup or be ok with this application
  # being the default app for the domain.
  task :cold do
    update
    site5::link_public_html
    site5::kill_dispatch_fcgi
    run "touch #{ current_path }/tmp/restart.txt"
  end
 
  desc <<-DESC
    Site5 version of restart task.
  DESC
  task :restart do
    site5::kill_dispatch_fcgi
  end

  namespace :db do
    task :replace_conf do
      run "ln -nfs /home/#{user}/apps/#{application}/db/database.yml #{current_path}/config/database.yml"
    end
  end

  namespace :site5 do
    desc <<-DESC
      Links public_html to current_release/public
    DESC
    task :link_public_html do
      run "cd /home/#{user}; rm -rf public_html; ln -s #{current_path}/public ./public_html"
    end
 
    desc <<-DESC
      Kills Ruby instances on Site5
    DESC
    task :kill_dispatch_fcgi do
      run "skill -u #{user} -c ruby"
    end
  end

  after "deploy:symlink", "deploy:db:replace_conf"
end

# ==============================
# Uploads
# ==============================

namespace :uploads do

  desc <<-EOD
    Creates the upload folders unless they exist
    and sets the proper upload permissions.
  EOD
  task :setup, :except => { :no_release => true } do
    dirs = uploads_dirs.map { |d| File.join(shared_path, d) }
    run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod g+w #{dirs.join(' ')}"
  end

  desc <<-EOD
    [internal] Creates the symlink to uploads shared folder
    for the most recently deployed version.
  EOD
  task :symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/public/system"
    run "ln -nfs #{shared_path}/public/system #{release_path}/public/system"
  end

  desc <<-EOD
    [internal] Computes uploads directory paths
    and registers them in Capistrano environment.
  EOD
  task :register_dirs do
    set :uploads_dirs,    %w(system system/paperclips)
    set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
  end

  after       "deploy:finalize_update", "uploads:symlink"
  on :start,  "uploads:register_dirs"

end
