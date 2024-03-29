module RestActionsConcern
  extend ActiveSupport::Concern
  include ResourceUrlsConcern
  include ResourceInflectionsConcern

  included do 
    respond_to :html
    responders :flash

    helper_method :resource_class
    #helper_method :query_class -- see admino gem docs for more, and dev_notes/pdf
  end

  def resource_class
    controller_name.classify.constantize
  end

  def index
    @collection = resource_class.all
    respond_with @collection
  end
  def new
    @resource = resource_class.new
    respond_with @resource
  end
  def create
    @resource = resource_class.new(permitted_params)
    if @resource.save
      respond_with @resource, location: collection_path
    else
      render :new
    end
  end
  def edit
    @resource = resource_class.find(params[:id])
    respond_with @resource
  end
  def update
    @resource = resource_class.find(params[:id])
    @resource.update_attributes(permitted_params)
    respond_with @resource, location: collection_path
  end
  def destroy
    @resource = resource_class.find(params[:id])
    @resource.destroy
    respond_with @resource, location: collection_path
  end

end