class Upload < ActiveRecord::Base
  has_many :embeds
  has_many :places, through: :embeds, source: :uploadable, source_type: 'Place'
  has_many :people, through: :embeds, source: :uploadable, source_type: 'Person'

  # start by just attaching image, and expand to other content types later
  # has_attached_file :attached, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"

  has_attached_file :attached,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    :storage => :fog,
                    :s3_credentials => Paperclip::Attachment.default_options[:fog_credentials] 

  validates_attachment_content_type :attached, content_type: /\Aimage\/.*\Z/

end
