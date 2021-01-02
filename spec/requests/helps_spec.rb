require 'rails_helper'

describe 'Help' do
  before do
    @help_url = '/api/v1/helps'
    @help_data = {
      title: 'This title',
      description: 'This is a very good description',
      category_id: 1,
      user_id: 1,
      location: '23.8, 109.02'
    }
  end

  after do
    # Do nothing
  end

  context 'Create new' do
    it 'returns unauthorized if user authorization header is missing' do
      post @help_url, params: @help_data, headers: {}
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unauthorized if user authorization header is invalid' do
      post @help_url, params: @help_data, headers: {'Authorization': '$2y$12ies.kdko380er.30urjohfo0'}
      expect(response).to have_http_status(:unauthorized)
    end

    context 'Authorized user' do
      before(:each) do
        @user = FactoryBot.create(:user)
        @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base, 'HS256')
      end

      it 'creates help and returns 201 created' do
        # @help_data['user_id'] = @user.id
        expect {
          post @help_url, params: @help_data, headers: {'Authorization': 'Bearer ' + @token}
        }.to change {Help.count}.from(0).to(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'Fetch helps' do
      it 'returns unauthorized if user authorization header is missing' do
        get @help_url, headers: {}
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns unauthorized if user authorization header invalid' do
        get @help_url, headers: {'Authorization': 'Bearer 84804i5.fjhroer.urierier'}
        expect(response).to have_http_status(:unauthorized)
      end
      context 'Valid Authentication' do
        before :each do
          @user = FactoryBot.create(:user)
          @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base, 'HS256')
        end

        it 'returns a list of helps with valid authorization' do
          FactoryBot.create :help
          get @help_url, headers: {'Authorization': 'Bearer ' + @token}
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body).count).to eq 1
        end

        it 'returns user with help when fetching' do
          FactoryBot.create :help
          get @help_url, headers: {'Authorization': 'Bearer ' + @token}
          expect(response).to have_http_status(:ok)
          # expect(JSON.parse(response.body).first.keys).to include("user")
        end
      end
    end
  end
end