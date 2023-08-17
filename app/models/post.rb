class Post < ApplicationRecord
  after_create :counter_posts_update
  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'author_id'

  def counter_posts_update(id)
    User.increment_counter(:posts_counter, id)
  end

  def recent_comments(id)
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
