require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users#index' do
    it 'if response status code is correct' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    
    it 'should render the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'check if the response body includes text(index)' do
      get users_path
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /users#show' do
  user = User.create(name: 'Theodoraldo', photo: 'photo_url', bio: 'bio_text', post_counter: 0, bio: 'Teacher from Peru.')
    it 'if response status code is correct' do
      get user_path(id: user.id)
      expect(response).to have_http_status(200)
    end

    it 'check if the response body includes text(show)' do
      get user_path(id: user.id)
      expect(response.body).to include('Here is a given user')
    end

    it 'should render the show template' do
      get user_path(id: user.id)
      expect(response).to render_template(:show)
    end
  end
end
