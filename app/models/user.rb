class User < ApplicationRecord
  after_initialize :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:user, :company, :admin]

  has_many :jobs, :foreign_key => 'company_id', :dependent => :destroy
  has_many :job_applications, :foreign_key => 'user_id'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def set_default_role
    self.role ||= :user
  end
end
