class User < ApplicationRecord

  # A  rank is created under a user. Every user has many ranks. If a user is deleted then all the associated ranks are destroyed
  has_many :ranks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
