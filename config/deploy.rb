require 'mina/bundler'
# require 'mina/rails'
require 'mina/git'
require 'mina/unicorn'
require 'mina/chruby'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, 'nonpandoras.com'
set :deploy_to, '/home/deploy/apps/unicorn_test'
set :repository, 'https://github.com/scarfacedeb/mina-unicorn-test'
set :branch, 'master'

set :forward_agent, true
set :user, "deploy"

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_dirs, ["tmp", "vendor/bundle"]

set :unicorn_env, :development
set :rails_env, :development
# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  invoke :'chruby', 'ruby-2.3'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'unicorn:restart'
    end
  end
end
