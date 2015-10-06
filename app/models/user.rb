class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :people, foreign_key: :author_id
  has_many :places, foreign_key: :author_id

  validates_presence_of :display_name
end
