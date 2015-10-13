require 'rails_helper'

RSpec.describe Upload, type: :model do
  it 'has a valid factory' do
    expect( build( :upload ) ).to be_valid
  end
  let( :upload ){ build( :upload ) }

  describe 'associations' do
    it { expect( upload ).to have_many( :embeds ) }
    it { expect( upload ).to have_many( :places ).through( :embeds ) }
    # it { expect( upload ).to have_and_belong_to_many( :people ) }
    # it { expect( upload ).to have_many( :tags ) } # may need add'l tests to ensure that no db bloat - multiple tag assignments of same value
  end
end
