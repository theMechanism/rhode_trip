class Place < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :author, polymorphic: true
  has_and_belongs_to_many :people, :uniq => true
  has_and_belongs_to_many :categories, :uniq => true
  acts_as_taggable
  
  # validations to do:
  # Address in RI, -- validate zip + city name against list

  validates :name, presence: true, uniqueness: true
  validates :categories, presence: true#, inclusion: { in:  Category.all, message: "%{value} is not a valid category" }
  validates :address, presence: true, address: true# and need validate against hard coded list of zip codes when possible
  # validates_with AddressValidator

  attr_accessor :line_1, :line_2, :city, :zip

end
