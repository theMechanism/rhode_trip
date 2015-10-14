class Public::StaticController < ApplicationController
  skip_before_action :authenticate_user!, :authenticate_admin!

  def index
  end
end
