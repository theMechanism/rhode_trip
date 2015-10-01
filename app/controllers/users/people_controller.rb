class Users::PeopleController < UsersController
  def new
    @person = Person.new
  end

  def create
    @person = Person.create(person_params)
    redirect_to users_person_path(@person)
  end

  def show
    @person = Person.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:name, :abstract, :description, :occupation)
  end
end
