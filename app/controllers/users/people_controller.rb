class Users::PeopleController < ApplicationController

  def new
    @person = Person.new
  end

end
