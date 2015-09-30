class Person < ActiveRecord::Base
  belongs_to :author, polymorphic: true
end
