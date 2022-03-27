require 'rails_helper'

RSpec.describe Api::V1::Users::MeController, type: :controller do
  let!(:user) { create(:user) }
  let!(:token) { create(:token, resource_owner_id: user.id) }
  let!(:headers) { { 'Authorization' => "Bearer #{token.token}" } }

  describe 'GET #show' do
    before do
      request.headers.merge!(headers)
      get(:show)
    end
    it { expect(response).to have_http_status(:ok) }
  end
end
