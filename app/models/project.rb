class Project < ApplicationRecord
  belongs_to :user
  belongs_to :dev, class_name: 'User', optional: true
  belongs_to :angel, class_name: 'User', optional: true
  has_many :candidates

  validates :title, presence: true, uniqueness: true
  validates :catchphrase, presence: true, length: { minimum: 5, maximum: 120 }
  validates :description, presence: true
end
