desc "Make boolean 0 or 1"
task :make_true do
    User.where("boolean_column = 't'").update_all(boolean_column: 1)
    User.where("boolean_column = 'f'").update_all(boolean_column: 0)
end