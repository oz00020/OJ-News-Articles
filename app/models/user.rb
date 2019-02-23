class User < ApplicationRecord

  # A  rank is created under a user. Every user has many ranks. If a user is deleted then all the associated ranks are destroyed
  has_many :ranks, dependent: :destroy

  # A user has many pages under him and every page belongs to a specific user
  has_many :pages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
