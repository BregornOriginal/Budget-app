require 'rails_helper'

RSpec.describe 'Testing Groups:', type: :feature do
  before do
    @user = User.create(
      name: 'Tester',
      email: 'test@gmail.com',
      password: '123456'
    )

    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button('Log in')

    @group = Group.create(
      name: 'Savings',
      user_id: @user.id
    )
    describe 'GET /' do
      it 'returns http success' do
        get '/groups'
        expect(response).to have_http_status(:success)
      end

      it 'renders the correct template' do
        get '/groups'
        expect(response).to render_template(:index)
      end

      it 'includes the name of the app' do
        get '/groups'
        expect(response.body).to include('<h1>CATEGORIES</h1>')
      end
    end
  end
end
