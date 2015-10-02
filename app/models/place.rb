class Place < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, polymorphic: true
  has_and_belongs_to_many :people
  has_and_belongs_to_many :categories
  acts_as_taggable
  
  # validations to do:
  # Address in RI, -- validate zip + city name against list

  validates :name, presence: true, uniqueness: true
  validates :categories, presence: true#, inclusion: { in:  Category.all, message: "%{value} is not a valid category" }
  validates :address, presence: true# and need validate against hard coded list of zip codes when possible

  include Place::Address

end
