class Job < ApplicationRecord
  validates_presence_of :title, :description, :company, :location, :category_id
  belongs_to :category

  def posting_date
    self.created_at.strftime("%A, %b %d")
  end

  def self.by_category(category_id)
    where(category: category_id)
  end

  def self.by_location(location_name)
    where(location: location_name)
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
end
