class Lesson < ApplicationRecord
  belongs_to :user
  has_many :takes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  # has_many :followings, through: :active_relationships, source: :followed

  validates :title, presence: true
  validates :teacher, presence: true
  validates :user_id, presence: true

  def taken_by? user
  	takes.where(user_id: user.id).exists?
  end
end
