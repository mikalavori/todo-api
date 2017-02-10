require 'rails_helper'

RSpec.describe 'User authenticate', type: :request do
  let!(:user) {  User.create username: 'foo', email: 'foo@example.com', password: 'secret', password_confirmation: 'secret' }

  it 'returns 200 status and JWT token when credentials are correct' do
    post '/users/authenticate', params: { email: 'foo@example.com', password: 'secret' }, as: :json

    expect(response).to have_http_status :ok
    expect(json_body[:auth_token]).to eq UserAuth.token(user)
  end

  it 'returns 401 status when credentials are wrong' do
    post '/users/authenticate', params: { email: 'foo@example.com', password: 'wrong' }, as: :json

    expect(response).to have_http_status :unauthorized
  end
end
