class Admins::PeopleController < Admins::BaseController
  include RestActionsConcern

  private

  def permitted_params
    params.
      require(:person).
      permit(:name, :abstract, :description, :occupation, :allow_comments, :approved, :author_id, :author_type, :created_at, :updated_at)
  end
end
