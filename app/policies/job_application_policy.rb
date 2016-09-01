class JobApplicationPolicy < ApplicationPolicy

  def created_by_user?
    user.user? && record.user_id == user.id
  end

  def created_by_company?
    user.company? && record.job.company_id == user.id
  end

  def show?
    user.admin? || created_by_user? || created_by_company?
  end

  def create?
    user.admin? || user.user?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

end
