class Comment < ApplicationRecord
  after_create :update_comments_counter
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
