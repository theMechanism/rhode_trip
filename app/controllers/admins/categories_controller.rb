class Admins::CategoriesController < Admins::BaseController
  include RestActionsConcern

  def permitted_params
    params.
      require(:category).
      permit(:name, :is_parent)
  end
end
