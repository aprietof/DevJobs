class Job < ApplicationRecord
  include Sortable::InstanceMethods
  extend Sortable::ClassMethods

  validates_presence_of :title, :description, :company_name, :location, :category_id
  belongs_to :company, :class_name => 'User', :foreign_key => 'company_id'
  belongs_to :category
  has_many :job_applications
  has_many :applicants, :through => :job_applications, :class_name => 'User'
  has_many :jobs_skills
  has_many :skills, :through => :jobs_skills
  accepts_nested_attributes_for :skills


  def self.by_category(category_id)
    where(category: category_id)
  end

  def self.by_location(location_name)
    where(location: location_name)
  end

  def self.by_location_and_category(category_id, location_name)
    self.by_category(category_id).by_location(location_name)
  end

  def self.all_sort_by_date_skip_first
    self.all_sort_by_date.limit(9)[1..-1]
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
