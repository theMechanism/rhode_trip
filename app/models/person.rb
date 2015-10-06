class Person < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :places, :uniq => true
  acts_as_taggable
  
  validates :name, presence: true, uniqueness: true
  validates :abstract, :description, presence: true
end
