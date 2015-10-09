class Admins::PlacesController < Admins::BaseController
  include RestActionsConcern
  include TagsFromPermittedParams

  def create
    @resource = Place.create( permitted_params)
    if @resource.save
      assign_tags_to( @resource )
      respond_with @resource, location: collection_path
    else
      render :new
    end
  end

  def update
    @resource = Place.find( params[:id] )
    if @resource.update_attributes( permitted_params )
      assign_tags_to( @resource )
      respond_with @resource, location: collection_path
    else
      render :edit
    end
  end

  def permitted_params
    params.
      require(:place).
      permit(:line_1, :line_2, :city, :zip, :lat, :long, :name, :approved, :people, 
        :acts_as_taggable_on_tag => :name,
        :category_ids => []
      )
  end
end
