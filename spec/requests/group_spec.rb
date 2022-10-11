require 'rails_helper'
require './spec/helpers/auth_helper'

RSpec.configure do |c|
  c.include AuthHelper
end

RSpec.describe 'Budget', type: :request do
  subject do
    User.new(
      name: 'Julio',
      email: 'julio@gmail.com',
      password: '123456'
    )
  end
  
  describe 'GET /groups' do
    before(:example) { get '/groups' }
    
    it 'returns http success' do
      sign_in(subject)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the title' do
      expect(response.body).to include('<h1>Groups</h1>')
    end
  end
end