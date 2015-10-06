class Admins::PeopleController < Admins::BaseController
  include RestActionsConcern
  # include ResourceUrlsConcern
  # def index
  #   @people = Person.all
  # end

  # def show
  #   @person = Person.find(params[:id])
  #   # respond_with @person
  # end

  # def edit
  #   @person = Person.find(params[:id])
  # end

  # def update
  #   @person = Person.find(params[:id])
  #   @person.update_attributes(permitted_params)
  #   respond_with @person, location: admins_people_path
  # end

  private

  # def resource_class
  #   Person
  # end

  def permitted_params
    params.
      require(:person).
      permit(:name, :abstract, :description, :occupation, :allow_comments, :approved, :author_id, :author_type, :created_at, :updated_at)
  end

  # def collection_path
  #   admins_people_path
  # end
end
