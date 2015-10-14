class Public::ExploreController < ApplicationController
  skip_before_action :authenticate_user!, :authenticate_admin!

  def index
    @people = Person.where(approved: true)
    @places = Place.where(approved: true)
  end
end
