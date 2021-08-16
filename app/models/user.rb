class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:facebook]
  
  validates :name, presence: true
  has_many :stories  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid)
    first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
    end
  end
end
