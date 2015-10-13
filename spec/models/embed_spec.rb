require 'rails_helper'

RSpec.describe Embed, type: :model do
  it 'has a valid factory' do
    expect( build( :embed ) ).to be_valid
  end
  let( :embed ){ build( :embed ) }

  describe 'associations' do
    it { expect( embed ).to belong_to( :upload ) }
    it { expect( embed ).to belong_to( :uploadable ) }
  end
end
