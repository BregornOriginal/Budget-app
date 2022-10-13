require 'rails_helper'

RSpec.describe 'Splash', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'includes the name of the app' do
      get '/'
      expect(response.body).to include('<h1>Budget tracker</h1>')
    end
  end
end
