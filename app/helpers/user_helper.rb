module UserHelper

  def available_roles
    User.roles
  end
end
