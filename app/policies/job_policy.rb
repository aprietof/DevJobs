class JobPolicy < ApplicationPolicy

  def created_by_company?
    user.company? && record.company_id == user.id
  end

  def create?
    user.admin? || user.company?
  end

  def update?
    user.admin? || created_by_company?
  end

  def destroy?
    user.admin? || created_by_company?
  end

end
