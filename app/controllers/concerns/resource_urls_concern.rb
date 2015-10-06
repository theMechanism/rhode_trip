module ResourceUrlsConcern
  extend ActiveSupport::Concern

  def collection_path
    url_for(controller: controller_path, action: :index)
  end

end