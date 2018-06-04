class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:member, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  private 
  def set_default_role
    self.role ||= :member
  end
end
