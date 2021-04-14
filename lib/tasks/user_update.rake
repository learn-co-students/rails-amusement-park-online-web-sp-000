namespace :db do
    namespace :user_update do      
        desc 'fix deprecation'
        task :user_update do
            User.where("boolean_column = 't'").update_all(boolean_column: 1)
        end
    end
end