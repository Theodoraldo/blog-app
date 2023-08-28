require 'rails_helper'

RSpec.describe Comment, type: :model do
  # tests go here

  describe 'associations' do
    it 'belongs to user' do
      comment = Comment.reflect_on_association(:user)
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'belongs to post' do
      comment = Comment.reflect_on_association(:post)
      expect(comment.macro).to eq(:belongs_to)
    end
  end

  describe 'update_comment_counter' do
    let(:user) { User.create(name: 'Microverse', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Collaboratively', post_counter: 0) }
    let(:post) do
      Post.create(title: 'test', text: 'post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
    end
    subject { Comment.create(post_id: post.id, user_id: user.id) }

    it 'increments the comments counter on the associated post' do
      expect { subject.send(:update_comments_counter) }.to change { post.reload.comments_counter }.by(2)
    end
  end
end
