class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :recoverable, :rememberable,
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

  validates :email, presence: true
	validates :encrypted_password, presence: true

  has_many :comments
	has_many :posts
	
end