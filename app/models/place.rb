class Place < ActiveRecord::Base
  include ActiveModel::Validations # custom AddressValidator defined in app/validators/address_validator

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :people, :uniq => true
  has_and_belongs_to_many :categories, :uniq => true
  acts_as_taggable
  has_many :embeds, as: :uploadable
  has_many :uploads, through: :embeds#, source_type: "Uploadable"

  accepts_nested_attributes_for :tags

  attr_accessor :acts_as_taggable_on_tag
  
  validates :name, presence: true, uniqueness: true
  validates :categories, presence: true#, inclusion: { in:  Category.all, message: "%{value} is not a valid category" }
  validates_presence_of :line_1
  validates :zip_city, presence: true, address: true

  def address
    [ self.line_1, self.line_2.to_s, self.city, self.zip ].join(' ')
  end

  private
  
  def zip_city
    {
      zip: self.zip,
      city: self.city
    }
  end


end
