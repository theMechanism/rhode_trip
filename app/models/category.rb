class Category < ActiveRecord::Base
  belongs_to :category# possible self join if category has parents
end
