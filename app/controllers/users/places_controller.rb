class Users::PlacesController < UsersController

  def new 
    @place = Place.new
  end

  def create
    @place = Place.create(place_params.merge({
      address: address,
      author: current_user 
    }))
    if @place.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :line_1, :line_2, :city, :zip, :category_ids => [], :person_ids => [])
  end

  def address # this is not awesome -- move into module
    place_params.select{|k, v| Place::Address::ATTRS.include?(k.to_sym) }.to_json
  end

end
