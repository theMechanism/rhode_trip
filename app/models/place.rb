class Place < ActiveRecord::Base
  include ActiveModel::Validations # custom AddressValidator defined in app/validators/address_validator

  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :people, :uniq => true
  has_and_belongs_to_many :categories, :uniq => true
  acts_as_taggable
  
  validates :name, presence: true, uniqueness: true
  validates :categories, presence: true#, inclusion: { in:  Category.all, message: "%{value} is not a valid category" }
  # validates :address, presence: true, address: true

  # attr_accessor :line_1, :line_2, :city, :zip

  # before_validation(on: :create) do
  #   self.address = {
  #     line_1: self.line_1,
  #     line_2: self.line_2,
  #     city: self.city,
  #     zip: self.zip
  #   }
  # end

  # def line_1 
  #   address ? address.line_1 : ''
  # end

end
