class User < ApplicationRecord
  has_many :collaborators
  has_many :wikis, through: :collaborators
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:member, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  delegate :wikis, to: :collaborators

  def collaborators
    Collaborator.where(user_id: id)
  end

  private 
  def set_default_role
    self.role ||= :member
  end
end
