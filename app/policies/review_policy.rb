class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    @user == @record.user
  end

  def destroy?
    @user == @record.user
  end

  def show?
    true
  end
end
