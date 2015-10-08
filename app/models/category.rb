class Category < ActiveRecord::Base
  belongs_to :parent, class_name: :Category
  has_and_belongs_to_many :places, :uniq => true

  validates :name, uniqueness: true, presence: true
end
