module TagsFromPermittedParams

  def assign_tags_to( resource )
    tags = permitted_params[:acts_as_taggable_on_tag][:name].scan(/\w+/)
    unless tags.empty?
      tags.each{|t| resource.tags.create(name: t) }
    end
  end
  
end