class Admins::UsersController < Admins::BaseController
  include RestActionsConcern

  def permitted_params
    params.
      require(:user).
      permit(:display_name, :email, :password, :can_self_publish)
  end
end
