class Upload < ActiveRecord::Base
  has_many :embeds
  has_many :places, through: :embeds, source: :uploadable, source_type: 'Place'
  has_many :people, through: :embeds, source: :uploadable, source_type: 'Person'

end
