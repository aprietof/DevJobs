class Category < ApplicationRecord
  include Sortable::InstanceMethods
  validates_presence_of :name
  has_many :jobs
end
