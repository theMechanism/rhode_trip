class Person < ActiveRecord::Base
  belongs_to :author, polymorphic: true
  has_and_belongs_to_many :places
  acts_as_taggable
  
end
