class Quiz < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :topic, presence: true, length: { minimum: 3 }
  validates :level, presence: true, numericality: { in: 1..12, message: 'must be in range of 1 to 12' }
  validates :format, presence: true
  validates :length, presence: true, numericality: { in: 1..5, message: ' must be in range of 1 to 5' }
end
