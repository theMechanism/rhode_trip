class Category < ActiveRecord::Base
  belongs_to :category# possible self join if category has parents
  has_and_belongs_to_many :places, :uniq => true

  validates :name, uniqueness: true, presence: true
end
