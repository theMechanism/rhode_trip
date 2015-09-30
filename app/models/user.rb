class User < ActiveRecord::Base
  has_many :people, as: :author
  has_many :places, as: :author
end
