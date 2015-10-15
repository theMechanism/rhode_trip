# base builder class that compiles composite params to create a legit --- to do ... as it is not yet a crucial piece

class CompositeBuilder
  def initialize( base_name, params )
    @base_class = base_name.to_s.capitalize.constantize
    @params = params
    @instance = nil
    @associations = []
    build
  end

  private

  def build
    filter_params
    build_instance
    build_associations
    return {
      resource: @instance,
      associations: @associations
    }
  end

  def filter_params
    keys = @base_class.new.attributes.keys
    # filter the input params to keys for the class
    # instantiate object
    # add associations on a per - association basis 
    # return the instance, and the associations
  end

  def build_instance( filtered )
  end

  def build_associations
    make_one_association
  end

  def make_one_association
  end

end