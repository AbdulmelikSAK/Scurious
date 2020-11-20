class Candidate < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :message, presence: true, length: { minimum: 5, maximum: 280 }
end
