class Skill < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :jobs_skills
  has_many :jobs, :through => :jobs_skills
end
