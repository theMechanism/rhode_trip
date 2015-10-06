module ResourceUrlsConcern
  extend ActiveSupport::Concern

  def collection_path
    url_for(controller: controller_path, action: :index)
  end

  def new_resource_path
    url_for(controller: controller_path, action: :new)
  end

  def edit_resource_path(resource)
    url_for(controller: controller_path, action: :edit, id: resource)
  end

  def resource_path(resource)
    url_for(controller: controller_path, action: :show, id: resource)
  end

end