class User < ActiveRecord::Base
  enum role: [:operator, :manager, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  belongs_to :company

  def set_default_role
    self.role ||= :operator
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end