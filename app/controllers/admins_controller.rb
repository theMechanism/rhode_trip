class AdminsController < ApplicationController
  before_action :authenticate_admin!

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  include Responders::CollectionResponder

  layout 'admins'
end
