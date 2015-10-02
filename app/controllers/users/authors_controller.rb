class Users::AuthorsController < UsersController
  def index
    @people = Person.where(approved: true)
    @places = Place.where(approved: true)
  end
end
