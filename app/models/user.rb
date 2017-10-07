class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lessons, dependent: :destroy
  has_many :takes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :following
  # has_many :favorites, dependent: :destroy


  mount_uploader :image, ImageUploader


  validates :name,
    presence: true,
    length: { maximum: 8 }
  validates :username,
  	presence: true,
  	uniqueness: true,
  	length: { maximum: 15 },
  	format: { with: /\A[a-z0-9]+\z/i }
  validates :bio, length: { maximum: 160 } 

  def followed_by? user
    passive_relationships.find_by(following_id: user.id).present?
  end
end
