module RestActionsConcern
  extend ActiveSupport::Concern
  include ResourceUrlsConcern
  
  included do 
    respond_to :html
    responders :flash
  end

  def resource_class
    controller_name.classify.constantize
  end

  def index
    @collection = resource_class.all
    respond_with @collection
  end

end