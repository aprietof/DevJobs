class Job < ApplicationRecord
  def posting_date
    self.created_at.strftime("%A, %b %d")
  end
end
