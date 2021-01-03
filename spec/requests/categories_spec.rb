require 'rails_helper'

describe 'Categories', type: :request do
  context 'Fetch' do
    before do
      FactoryBot.create :category, {
        name: 'Material',
        color: 'red'
      }
    end

    it 'returns a list of categories' do
      get '/api/v1/categories'
      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body).count).to eq 3
    end

    # it 'returns category by id' do
    #   get '/api/v1/categories/1'
    # end
  end
end