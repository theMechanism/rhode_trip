module Place::Address
  # assuming all addresses in RI -- so no state input
  attr_accessor :line_1, :line_2, :city, :zip

  def quack
    'meep meep'
  end
end