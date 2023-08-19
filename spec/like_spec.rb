require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      like = Like.reflect_on_association(:user)
      expect(like.macro).to eq(:belongs_to)
    end

    it 'belongs to post' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eq(:belongs_to)
    end
  end

  describe 'check like method' do
    let(:user) { User.create(name: 'Microverse', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Collaboratively', post_counter: 0) }
    let(:post) do
      Post.create(title: 'test', text: 'post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
    end
    subject { Like.create(post_id: post.id, user_id: user.id) }

    it 'should increments likes_counter by 1' do
      expect { subject.send(:update_likes_counter) }.to change { post.reload.likes_counter }.by(2)
    end
  end
end
