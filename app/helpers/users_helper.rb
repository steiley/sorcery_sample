module UsersHelper
  def can_create(user)
    can_create_or_update false
  end

  def can_update(user)
    can_create_or_update(user == current_user)
  end

  def can_create_or_update(owner)
    current_user.admin? || owner
  end

  def can_destroy(user)
    !user.admin? && current_user.admin?
  end
end