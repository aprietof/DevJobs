class JobPolicy < ApplicationPolicy

  def update?
    user
  end

end
