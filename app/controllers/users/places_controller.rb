class Users::PlacesController < UsersController

  def new 
    @place = Place.new
    @categories = Category.all
  end

end
