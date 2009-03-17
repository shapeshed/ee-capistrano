##########################################
# Remote server
##########################################
set :deploy_to, "/var/www/vhosts/#{application}/httpdocs/"
set :deploy_via, :remote_cache
set :copy_strategy, :checkout
set :keep_releases, 3
after "deploy:update", "deploy:cleanup" 
set :use_sudo, false
set :copy_exclude, [".git/*"] 
set :copy_compression, :bz2

role :app, "yourstagingserver.com"
role :web, "yourstagingserver.com"
role :db,  "yourstagingserver.com", :primary => true

desc "This is here to overide the original :restart"
deploy.task :restart, :roles => :app do
  # do nothing but overide the default
end

##########################################
# Shared resources. If you have shared resources in /shared this creates symlinks
##########################################

# desc 'Link shared resources'
# task :after_symlink do
#   run "ln -nfs #{deploy_to}/#{shared_dir}/fckeditor/ #{deploy_to}/#{current_dir}/public/fckeditor"
#   run "ln -nfs #{deploy_to}/#{shared_dir}/images/uploads/ #{deploy_to}/#{current_dir}/public/images/uploads"
# end