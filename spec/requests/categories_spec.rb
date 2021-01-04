require 'rails_helper'

describe 'Categories', type: :request do
  context 'Fetch' do
    before do
      @category = FactoryBot.create :category, {
        name: 'Material',
        color: 'red'
      }
    end

    it 'returns a list of categories' do
      get '/api/v1/categories'
      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body).count).to eq 1
    end

    it 'returns category by id' do
      get '/api/v1/categories/1'
      expect(JSON.parse(response.body).keys).to match_array %w(name color id created_at updated_at)
    end

    it 'returns helps in category by id' do
      user = FactoryBot.create :user
      help_data = {
        title: 'Second help',
        description: 'This is a very good description',
        category_id: @category.id,
        user_id: user.id,
        location: '33.2, 103.02'
      }
      FactoryBot.create :help, help_data
      get '/api/v1/categories/1/helps'
      expect(JSON.parse(response.body).first.keys).to match_array(
        %w(title description user_id category_id id location status created_at updated_at))
    end
  end
end