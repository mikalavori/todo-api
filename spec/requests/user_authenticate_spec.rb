require 'rails_helper'

RSpec.describe 'User authenticate', type: :request do
  let!(:user) { create :user }

  it 'returns 200 status and JWT token when credentials are correct' do
    post '/user/authenticate', params: { email: user.email, password: user.password }, as: :json

    expect(response).to have_http_status :ok
    expect(json_body[:user][:auth_token]).to eq UserAuth.token(user)
  end

  it 'returns 401 status when credentials are wrong' do
    post '/user/authenticate', params: { email: user.email, password: 'wrong' }, as: :json

    expect(response).to have_http_status :unauthorized
  end
end
