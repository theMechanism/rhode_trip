class Users::PeopleController < UsersController
  def new
    @person = Person.new
  end

  def create
    p '#'*80
    p params
    p "#{params.inspect}"
    # byebug
    @person = Person.create(person_params)
    redirect_to users_person_path(@person)
  end

  def show
    @person = Person.find(params[:id])
    @places = @person.places
  end

  private

  def person_params
    params.require(:person).permit(:name, :abstract, :description, :occupation, :place_ids => [])
  end
end
