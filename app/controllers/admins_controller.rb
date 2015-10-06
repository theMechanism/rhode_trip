class AdminsController < ApplicationController
  skip_before_action :authenticate_user!

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  include Responders::CollectionResponder

  layout 'admins'
end
