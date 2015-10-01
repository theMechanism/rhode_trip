class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :people, as: :author
  has_many :places, as: :author

  ROLES = %w(Super Author)
  # Super has control over all models, and CRUD rights for content created by others
  # Author can self publish (approve their own people + places), and add categories ( though not destroy or edit existing )

  validates :role, inclusion: { in: ROLES, message: "%{value} is not a valid Admin role" }, presence: true
end
