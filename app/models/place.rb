class Place < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, polymorphic: true
end
