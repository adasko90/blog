class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :recoverable, :rememberable,
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

    has_many :comments
	has_many :posts
	has_many :posts, through: :comments
end