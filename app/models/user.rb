class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true
  validates :profile, presence: true
  validates :role, presence: true, inclusion: { in: ["creator", "developer", "angel"] }

  has_many :projects
  has_many :candidates

  has_one_attached :photo
end
