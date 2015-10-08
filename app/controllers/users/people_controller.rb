class Users::PeopleController < UsersController
  def new
    @person = Person.new
    @person.tags.build
  end

  def create
    @person = Person.create(person_params)
    # if tag_params
    #   foo = tag_params.scan(/\w+/)
    #   # .each{ |t| @person.tags.create(name: t) }
    # end
    byebug
    redirect_to users_person_path(@person)
  end

  def show
    @person = Person.find(params[:id])
    @places = @person.places
  end

  private

  def person_params
    params.require(:person).permit(:name, :abstract, :description, :occupation, :tags_atttibutes, :place_ids => [] )
  end

end
