class Take < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :lesson_id }
  validates :lesson, presence: true
end
