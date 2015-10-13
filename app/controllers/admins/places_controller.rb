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

  private

  def arbitrary_upload_keys
    if params[:place] && params[:place][:uploads_attributes]
      nested = params[:place][:uploads_attributes]
      nested.keys.map do |c| 
        {"#{c}" => nested["#{c}"][:attachment]}
      end
    else
      nil
    end
  end

  def permitted_params
    params.
      require(:place).
      permit(:line_1, :line_2, :city, :zip, :lat, :long, :name, :approved, :people, 
        :uploads_attributes => arbitrary_upload_keys,
        :acts_as_taggable_on_tag => :name,
        :category_ids => []
      )
  end
end
