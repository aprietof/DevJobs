class Category < ApplicationRecord
  include Sortable::InstanceMethods
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :jobs
end
