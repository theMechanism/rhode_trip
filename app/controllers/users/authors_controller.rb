class Users::AuthorsController < UsersController
  def index
    @people = Person.all
    @places = Place.all
  end
end
