require 'rails_helper'

describe 'Users' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'Register' do
    it 'creates user in the database and returns 201' do
      expect {
        post '/api/v1/users', params: {
          first_name: 'Ola',
          last_name: 'Kunle',
          email: 'kunsal@email.com',
          password: BCrypt::Password.create('abcdef'),
          government_id: 'kdkkdkdkdkdkkd'
        }
      }.to change {User.count}.from(0).to(1)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body).keys).to match_array(%w[user token message])
    end
  end

  context 'Login' do
    before(:each) do
      FactoryBot.create(:user, {
        first_name: 'Olakunle',
        last_name: 'Salami',
        email: 'kunsal@email.com',
        password: BCrypt::Password.create('password'),
        government_id: 'blahblahblah.jpg'
      })
      @credentials = {
        email: 'kunsal@email.com', password: 'password'
      }
    end

    it 'should return with error is email is not present' do
      @credentials['email'] = ''
      post '/api/v1/login', params: @credentials
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should return with error is password is not present' do
      @credentials['password'] = ''
      post '/api/v1/login', params: @credentials
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should return with unauthorized if email is not in database' do
      @credentials['email'] = 'kay@zmail.co'
      post '/api/v1/login', params: @credentials
      expect(response).to have_http_status(:unauthorized)
    end

    it 'should return with unauthorized if passwords do not match' do
      @credentials['password'] = 'abcdefg'
      post '/api/v1/login', params: @credentials
      expect(response).to have_http_status(:unauthorized)
    end

    it 'should log user in with valid credential' do
      post '/api/v1/login', params: @credentials
      expect(response).to have_http_status(:success)
    end

    it 'should return token when login is successful' do
      post '/api/v1/login', params: @credentials
      puts response.body.inspect
      expect(JSON.parse(response.body).keys).to match_array(%w[token exp])
    end
  end
end