class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # def index?
  #   user.has_role?(:admin)
  # end

  # def show?
  #   user.has_role?(:admin) || record.user == user
  # end

  # def create?
  #   user.has_role?(:admin)
  # end

  # def update?
  #   user.has_role?(:admin) || record.user == user
  # end

  # def destroy?
  #   user.has_role?(:admin) || record.user == user
  # end
end

