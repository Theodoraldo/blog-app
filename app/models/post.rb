class Post < ApplicationRecord
  after_create :counter_posts_update
  validates :title, presence: true, length: { maximum: 250, too_long: '%{ count } characters is the maximum allowed' }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'author_id'

  def counter_posts_update
    user.update(post_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
