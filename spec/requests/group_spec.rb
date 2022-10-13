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

  before :each do
    group = Group.new
    group.user = subject
    group.id = 1
    group.save
  end

  context 'GET #index' do
    it 'renders the :index view' do
      sign_in(subject)
      get '/groups/1'

      expect(response).to be_successful

      expect(response).to render_template(:show)

      expect(response.body).to include('CATEGORIES')
    end
  end
end
