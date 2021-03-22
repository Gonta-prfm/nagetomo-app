class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  #ユーザーがフォローしているユーザーとのアソシエーション
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :follewings, through: :relationships, source: :follow

  #ユーザーをフォローしてくれているユーザーとのアソシエーション
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "follow_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  
  validates :profile,  length: {maximum: 200}

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  end
end
