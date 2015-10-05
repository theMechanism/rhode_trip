class Admins::PeopleController < AdminsController

  def index
    @people = Person.all
  end
end
