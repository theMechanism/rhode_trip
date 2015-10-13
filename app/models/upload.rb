class Upload < ActiveRecord::Base
  has_many :embeds
  has_many :uploadables, through: :embeds
end
