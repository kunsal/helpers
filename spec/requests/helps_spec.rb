require 'rails_helper'

describe 'Help' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'Create new' do
    url = '/api/v1/helps'
    help_data = {
      title: 'This title',
      description: 'This is a very good description',
      category_id: 1,
      user_id: 1,
      location: '23.8, 109.02'
    }

    it 'returns unauthorized if user authorization header is missing' do
      post url, params: help_data, headers: {}
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unauthorized if user authorization header is invalid' do
      post url, params: help_data, headers: {'Authorization': '$2y$12ies.kdko380er.30urjohfo0'}
      expect(response).to have_http_status(:unauthorized)
    end

    context 'Authorized user' do
      before(:each) do
        user = FactoryBot.create(:user)
        puts user.inspect
      end

      it 'creates help and returns 201 created' do
        expect {
          post url, params: help_data
        }.to change {Help.count}.from(0).to(1)
        expect(response).to have_http_status(:created)
      end
    end

  end
end