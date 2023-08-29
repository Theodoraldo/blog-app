require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Theodore', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 0, bio: 'Teacher from Mexico.') }
  before { subject.save }

  describe 'validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'post_count to be greater or equal to zero' do
      subject.post_counter = -1
      expect(subject).not_to be_valid
    end

    it 'post_count should be number' do
      subject.post_counter = 'Text'
      expect(subject).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many posts' do
      user = User.reflect_on_association(:posts)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many comments' do
      user = User.reflect_on_association(:comments)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many likes' do
      user = User.reflect_on_association(:likes)
      expect(user.macro).to eq(:has_many)
    end
  end

  describe 'user class method' do
    it 'should three most recent post' do
      expect(subject.recent_posts).to eq(subject.posts.order(updated_at: :desc).limit(3))
    end
  end
end
