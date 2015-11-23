class Idea < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :joins, dependent: :destroy
  has_many :joining_users, through: :joins, source: :user

  validates :title, { presence: true,
                      uniqueness: { message: "Title currently exists"},
                      length:     { minimum: 1}}


  def liked_by?(user)
    like_for(user).present?
  end

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

  def joined_by?(user)
    join_for(user).present?
  end

  def join_for(user)
    joins.find_by_user_id(user.id)
  end

end
