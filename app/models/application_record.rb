class ApplicationRecord < ActiveRecord::Base
  # if you need some logic that will work for all or some classes(models) you would usually put that inside ApplicationRecord class so you follow the DRY pattern
  self.abstract_class = true
end
