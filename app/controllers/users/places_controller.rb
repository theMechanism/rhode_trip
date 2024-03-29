class Users::PlacesController < UsersController
  include TagsFromPermittedParams
  
  def new 
    @place = Place.new
    @place.tags.build
  end

  def create
    @place = Place.create( permitted_params )
    if @place.valid?
      assign_tags_to( @place )
      redirect_to users_place_path( @place )
    else
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
    @people = @place.people
    @categories = @place.categories
  end
  
  private

  def permitted_params
    params.require(:place).permit(:name, :line_1, :line_2, :city, :zip, 
      :category_ids => [], 
      :person_ids => [],
      :acts_as_taggable_on_tag => :name,
    )
  end
end
