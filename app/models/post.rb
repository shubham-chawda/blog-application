class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true

  scope :other_user, ->(current_user) { where.not(user_id: current_user.id, publish: false) }
end
