require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /' do
    before(:example) { get '/' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the name of the app' do
      expect(response.body).to include('<h1>budget tracker</h1>')
    end
  end
end
