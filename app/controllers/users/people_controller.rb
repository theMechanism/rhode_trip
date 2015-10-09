class Users::PeopleController < UsersController
  include TagsFromPermittedParams

  def new
    @person = Person.new
    @person.tags.build
  end

  def create
    @person = Person.create( permitted_params)
    assign_tags_to( @person )
    redirect_to users_person_path( @person )
  end

  def show
    @person = Person.find( params[:id] )
    @places = @person.places
  end

  private

  def permitted_params
    params.require(:person).permit(:name, :abstract, :description, :occupation, 
      :acts_as_taggable_on_tag => :name, 
      :place_ids => [] )
  end

end
