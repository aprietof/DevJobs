class Category < ApplicationRecord
  include Sortable::InstanceMethods
  has_many :jobs
end
