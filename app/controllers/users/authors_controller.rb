class Users::AuthorsController < ApplicationController

  def index
    @people = Person.all
  end
end
