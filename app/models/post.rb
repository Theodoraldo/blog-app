class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'author_id'

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments(id)
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
