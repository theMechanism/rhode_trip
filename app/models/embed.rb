class Embed < ActiveRecord::Base
  belongs_to :uploadable, polymorphic: true
  belongs_to :upload
end
