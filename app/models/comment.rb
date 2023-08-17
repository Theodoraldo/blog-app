class Comment < ApplicationRecord
  after_create :update_comment_counter
  belongs_to :user
  belongs_to :post

  def update_comment_counter(post_id)
    Post.increment_counter(:comments_counter, post_id)
  end
end
