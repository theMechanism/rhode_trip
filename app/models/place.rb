class Place < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, polymorphic: true
  has_and_belongs_to_many :people
  acts_as_taggable
  
end
