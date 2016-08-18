class JobPolicy < ApplicationPolicy

  def created_by_company?
    user.company? && record.user_id == user.id
  end


  def create?
    user.admin? || created_by_company?
  end

  def new?
    user.admin? || created_by_company?
  end

  def update?
    user.admin? || created_by_company?
  end


  def destroy?
    user.admin? || created_by_company?
  end

end
