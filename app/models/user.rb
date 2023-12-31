class User < ApplicationRecord
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end

  private

  def set_default_posts_counter
    self.posts_counter ||= 0
  end
end
