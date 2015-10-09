class Admins::PeopleController < Admins::BaseController
  include RestActionsConcern
  include TagsFromPermittedParams

  def create
    @resource = Person.create( permitted_params)
    if @resource.save
      assign_tags_to( @resource )
      respond_with @resource, location: collection_path
    else
      render :new
    end
  end

  def update
    @resource = Person.find( params[:id] )
    if @resource.update_attributes( permitted_params )
      assign_tags_to( @resource )
      respond_with @resource, location: collection_path
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.
      require(:person).
      permit(:name, :abstract, :description, :occupation, :allow_comments, :approved, :author_id, :author_type, :created_at, :updated_at,
        :acts_as_taggable_on_tag => :name)
  end
end
