class ApplicationRecord < ActiveRecord::Base
  include UlidPk
  self.abstract_class = true
end
