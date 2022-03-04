require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get posts_path }
    it 'Checks if status correct' do
      expect(response).to have_http_status(:ok)
    end

    it "Renders 'index' template for posts" do
      expect(response).to render_template('index')
    end
    it 'Checks if users/index html elements rendered' do
      expect(response.body).to include('users post index')
    end
  end
  describe 'GET /show' do
    before(:example) { get post_path(1) }

    it 'Response staturs correct' do
      expect(response).to have_http_status(:success)
    end
    it "Renders 'show' template for users" do
      expect(response).to render_template('show')
    end
    it 'Checks if response body includes correct placeholder text' do
      expect(response.body).to include('This is user 1 post')
    end
  end
end
