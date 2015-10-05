class AdminsController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'admins'
end
