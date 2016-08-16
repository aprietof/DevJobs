class Job < ApplicationRecord
  validates_presence_of :title, :description, :company, :location, :category_id
  belongs_to :category

  def self.all_sort_by_date
    self.all.order(created_at: "DESC" )
  end

  def posting_date
    self.created_at.strftime("%A, %b %d")
  end

  def self.by_category(category_id)
    where(category: category_id)
  end
end
