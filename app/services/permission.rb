class Permission
  def initialize(current_user, controller, action, id)
    @user = current_user
    @controller = controller
    @action = action
    @id = id
  end

  def authorized?
    if @user
      user_permissions
    else
      guest_permissions
    end
  end

  private

  def user_permissions
    return true if @controller == "sessions" && @action.in?(%w(new create destroy))
    return true if @controller == "users" && @action.in?(%w(new create edit update show destroy))
    return true if @controller == "profile" && @action.in?(%w(new create destroy))
  end

  def guest_permissions
    return true if @controller == "sessions" && @action.in?(%(new create))
  end
end
