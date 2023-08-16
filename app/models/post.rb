class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user, foreign_key: 'author_id'
end
