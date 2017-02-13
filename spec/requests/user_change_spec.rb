require 'rails_helper'

RSpec.describe 'User change', type: :request do
  let!(:user) { create :user }

  context 'when request is authorized' do
    context 'when given data is valid' do
      it 'returns 200 status and user data' do
        put '/user', params: { email: 'new_email@example.com' }, headers: { 'Authorization' => "Bearer #{UserAuth.token(user)}" }, as: :json

        expect(response).to have_http_status :ok
        expect(json_body[:user][:email]).to eq 'new_email@example.com'
      end
    end
  end
end
