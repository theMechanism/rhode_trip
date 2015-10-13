class Upload < ActiveRecord::Base
  has_many :embeds
  has_many :places, through: :embeds, source: :uploadable, source_type: 'Place'
  has_many :people, through: :embeds, source: :uploadable, source_type: 'Person'

  # start by just attaching image, and expand to other content types later
  has_attached_file :attached, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
