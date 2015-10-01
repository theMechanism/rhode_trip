class Users::AuthorsController < UsersController
  def index
    @people = Person.all
  end
end
