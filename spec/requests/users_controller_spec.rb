require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

RSpec.describe UsersController, type: :controller do
  render_views

  describe 'GET index' do
    it 'has a page related heading' do
      get :index
      expect(response.body).to match(/<h1>.*users/im)
    end
  end
end

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it "Renders 'index' template for users" do
      expect(response).to render_template('index')
    end
    it 'Checks if users/index html elements rendered' do
      expect(response.body).to include('users index')
    end
  end
  describe 'GET /show' do
    before(:example) { get user_path(1) }

    it 'Response staturs correct' do
      expect(response).to have_http_status(:success)
    end
    it "Renders 'show' template for users" do
      expect(response).to render_template('show')
    end
    it 'Checks if response body includes correct placeholder text' do
      expect(response.body).to include('This is user 1')
    end
  end
end
