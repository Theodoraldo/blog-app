require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Theodore', photo: 'https://unsplash.com/photos', bio: 'Teacher from Ghana', post_counter: 0)
  subject do
    Post.create(title: 'Test', text: 'First Test', author_id: user.id, comments_counter: 1, likes_counter: 1)
  end

  describe 'validations' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'comments cannot be less than zero' do
      subject.comments_counter = -10
      expect(subject).not_to be_valid
    end

    it 'likes cannot be less than zero' do
      subject.likes_counter = -2
      expect(subject).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to author' do
      post = Post.reflect_on_association(:user)
      expect(post.macro).to eq(:belongs_to)
    end

    it 'has many likes' do
      post = Post.reflect_on_association(:likes)
      expect(post.macro).to eq(:has_many)
    end

    it 'has many comments' do
      post = Post.reflect_on_association(:comments)
      expect(post.macro).to eq(:has_many)
    end
  end

  describe 'all test methods' do
    it 'should update the PostCounter attribute of the associated user' do
      expect(user.post_counter).to eq(0)
      subject.counter_posts_update
      expect(user.reload.post_counter).to eq(1)
    end

    it 'should five most recent post' do
      expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
    end
  end
end
