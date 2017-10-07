class Lesson < ApplicationRecord
  belongs_to :user
  has_many :takes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :teacher, presence: true
  validates :user_id, presence: true

  def taken_by? user
  	takes.where(user_id: user.id).exists?
  end
end
