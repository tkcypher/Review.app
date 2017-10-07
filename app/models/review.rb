class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :favorites, dependent: :destroy

  validates :user_id, presence: true
  validates :lesson_id, presence: true
  validates :body, presence: true, length: { maximum: 250 }

  def favorited_by? user
  	favorites.where(user_id: user.id).exists?
  end
end