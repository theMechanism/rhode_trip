class Person < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :places, :uniq => true
  acts_as_taggable
  accepts_nested_attributes_for :tags

  validates :name, presence: true, uniqueness: true
  validates :abstract, :description, presence: true

  # before_validation :split_tag_names_string

  # protected

  # def split_tag_names_string
  #   if self.tags_attributes
  #     byebug
  #   end
  # end
end
