class User < ActiveRecord::Base
  enum role: [:operator, :manager, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :create_mixpanel_personality, :if => :new_record?
  
  belongs_to :company

  def set_default_role
    self.role ||= :operator
  end

  def create_mixpanel_personality
  	require 'mixpanel-ruby'
	tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_PROJECT_TOKEN'])
	tracker.people.set(self.id, self.attributes)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :invitable, :database_authenticatable, :confirmable, :recoverable, :rememberable, :validatable, :trackable
end