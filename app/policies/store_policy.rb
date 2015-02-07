class StorePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @store = model
  end

  def index?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    @current_user == @store.user
  end

  def show?
    @current_user == @store.user
  end

  def update?
    @current_user == @store.user
  end

  def destroy?
    @current_user == @store.user
  end

end
