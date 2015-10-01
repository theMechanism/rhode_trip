class Users::AuthorsController < ApplicationController
  skip_before_action :authenticate_user!, :authenticate_admin!
  def index
    @people = Person.all
  end
end
