class Admins::CategoriesController < Admins::BaseController
  include RestActionsConcern

  private
  
  def permitted_params
    params.
      require(:category).
      permit(:name, :is_parent, :parent_id)
  end

end
