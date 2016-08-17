class Skill < ApplicationRecord
  has_many :jobs_skills
  has_many :jobs, :through => :jobs_skills
end
