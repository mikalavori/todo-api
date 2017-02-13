require 'rails_helper'

RSpec.describe 'User creation', type: :request do
  before do
    post '/user', params: { user: data }, as: :json
  end

  context 'when given data is valid' do
    let(:data) do
      {
        username: 'foo',
        email: 'foo',
        password: 'secret',
        confirmation_password: 'secret'
      }
    end

    it { expect(response).to have_http_status :created }
  end

  context 'when given data is not valid' do
    let(:data) { { username: 'foo', password: 'secret', confirmation_password: 'secret' } }

    it { expect(response).to have_http_status :unprocessable_entity }
    it { expect(response.content_type).to eq Mime[:json] }
  end
end
