class User < ActiveRecord::Base

  ROLES = [ nil, 'Author', 'Publisher', 'Admin' ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :people, foreign_key: :author_id
  has_many :places, foreign_key: :author_id

  validates_presence_of :display_name
  validates :role, inclusion: { in: ROLES }

  def is_admin?
    ROLES.drop(3).include?( self.role )
  end

  def can_self_publish?
    ROLES.drop(2).include?( self.role )
  end

  def is_author?
    ROLES.drop(1).include?( self.role )
  end

end
