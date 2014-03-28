class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    user.present? && scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  # def update?
  #   false
  # end

  # def edit?
  #   update?
  # end

  # def destroy?
  #   false
  # end

  def scope
    record.class
  end
end

