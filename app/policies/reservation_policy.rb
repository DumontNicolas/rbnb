class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    false
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
    @user == @record.user
  end
end