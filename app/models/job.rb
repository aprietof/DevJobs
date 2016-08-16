class Job < ApplicationRecord
  belongs_to :category
  
  def posting_date
    self.created_at.strftime("%A, %b %d")
  end
end
