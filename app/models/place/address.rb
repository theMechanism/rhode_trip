module Place::Address
  # assuming all addresses in RI -- so no state input
  ATTRS = :line_1, :line_2, :city, :zip

  attr_accessor :line_1, :line_2, :city, :zip

  def quack
    'meep meep'
  end

  def inputs_to_json
  end
end