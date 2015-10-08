class Users::PeopleController < UsersController
  def new
    @person = Person.new
    @person.tags.build
  end

  def create

    @person = Person.create( person_params) #.merge( get_tags )
    if tags
      @person.tags.create(name: tags)
    end
    redirect_to users_person_path(@person)
  end

  def show
    @person = Person.find(params[:id])
    @places = @person.places
  end

  private

  def person_params
    params.require(:person).permit(:name, :abstract, :description, :occupation, 
      :acts_as_taggable_on_tag => :name, 
      :place_ids => [] )
  end

  def tags
    person_params[:acts_as_taggable_on_tag][:name]
  end

end
