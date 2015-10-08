class Person < ActiveRecord::Base
  include ActiveModel::Dirty
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :places, :uniq => true
  acts_as_taggable
  accepts_nested_attributes_for :tags

  validates :name, presence: true, uniqueness: true
  validates :abstract, :description, presence: true

  attr_accessor :acts_as_taggable_on_tag
  before_save :assign_tags

  protected

  def assign_tags
    # self.acts_as_taggable_on_tag[:name]
    # self.attributes.changed?
    # byebug
  end
end
