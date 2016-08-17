class Job < ApplicationRecord
  validates_presence_of :title, :description, :company, :location, :category_id
  belongs_to :category
  has_many :jobs_skills
  has_many :skills, :through => :jobs_skills
  accepts_nested_attributes_for :skills

  def posting_date
    self.created_at.strftime("%b %d, %Y")
  end

  def self.by_category(category_id)
    where(category: category_id)
  end

  def self.by_location(location_name)
    where(location: location_name)
  end

  def self.by_location_and_category(category_id, location_name)
    self.by_category(category_id).by_location(location_name)
  end

  def self.all_sort_by_date
    self.all.order(created_at: "DESC" )
  end

  def self.order_and_paginated(params)
    self.all_sort_by_date.page(params).per(5)
  end

  def self.locations
    self.all.collect {|job| job.location}.uniq
  end

  def skills_attributes=(skill_attributes)
    skill_attributes.values.each do |skill_attribute|
      skill = Skill.find_or_create_by(skill_attribute)
      self.jobs_skills.build(skill: skill)
    end
  end

end
