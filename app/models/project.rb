class Project < ApplicationRecord
  belongs_to :user
  belongs_to :dev, class_name: 'User'
  belongs_to :angel, class_name: 'User'
  has_many :candidates

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :user, presence: true
end
