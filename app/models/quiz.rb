class Quiz < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :topic, presence: true
  validates :level, numericality: { in: 1..12, message: 'must be in range of 1 to 12' }
  validates :format, presence: true
  validates :length, numericality: { in: 1..5, message: ' must be in range of 1 to 5' }
end
