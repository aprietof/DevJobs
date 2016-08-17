class JobPolicy < ApplicationPolicy

  def update?
   user.admin? || record.try(:company) == company
  end

end
