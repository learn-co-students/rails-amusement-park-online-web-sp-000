# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task fix_booleans: :environment do
  require_relative 'app/models/user'
  User.where("admin = 't'").update_all(admin: 1)
  User.where("admin = 'f'").update_all(admin: 0)
end