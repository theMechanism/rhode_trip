class Admins::UploadsController < Admins::BaseController
  include RestActionsConcern

  def create
    @resource = resource_class.new(permitted_params)
    if @resource.save
      respond_with @resource, location: collection_path
    else
      render :new
    end
  end

  def permitted_params
    params.
      require( :upload ).
      permit( :attached )
  end
end
