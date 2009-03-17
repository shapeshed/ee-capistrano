##########################################
# Application
##########################################
set :application, "yoursite.com"

##########################################
# Deployment stages
# Run 'gem install capistrano-ext' to get multistage support
##########################################
set :stages, %w(staging live)
require 'capistrano/ext/multistage'


##########################################
# Source Control 
##########################################
set :repository,  "ssh://yourgitserver.com/var/git/yoursite.com.git"
set :scm, "git"
set :branch, "master"

