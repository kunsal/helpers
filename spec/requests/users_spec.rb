require 'rails_helper'

describe 'Users' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context '/POST user' do
    it 'returns 201 when user is created' do
      # expect {
        post '/api/v1/users', params: { user: {
          first_name: 'Ola',
          last_name: 'Kunle',
          email: 'kunsal@email.com',
          password: 'abcdef',
          government_id: 'kdkkdkdkdkdkkd'
        }}
      # }.to change {User.count}.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end
end