require 'rails_helper'

describe 'Help', type: :model do
  before(:each) do
    @help = FactoryBot.create(:help, {
      title: 'Help me',
      description: 'This is a sample description',
      category_id: 1,
      location: '35.4,108.1',
      status: 1,
      user_id: 1
    })
  end
  context 'Validations' do
    it 'ensures that title is present' do
      @help.title = nil
      expect(@help).to_not be_valid
    end

    it 'ensures that length of title is greater than 6' do
      @help.title = 'help '
      expect(@help).to_not be_valid
    end

    it 'ensures that title is present' do
      @help.description = nil
      expect(@help).to_not be_valid
    end

    it 'ensures that length of title is greater than 20' do
      @help.description = 'My description'
      expect(@help).to_not be_valid
    end

    it 'ensures that location is present' do
      @help.location = nil
      expect(@help).to_not be_valid
    end

    it 'ensures that location is of the format x,y' do
      @help.location = '32.9'
      expect(@help).to_not be_valid
    end

    it 'ensures that category_id is present' do
      @help.category_id = nil
      expect(@help).to_not be_valid
    end

    it 'ensures that category_id is a number' do
      @help.category_id = 'a'
      expect(@help).to_not be_valid
    end

    it 'ensures that category_id is a positive number' do
      @help.category_id = -1
      expect(@help).to_not be_valid
    end

    it 'ensures that user_id is present' do
      @help.user_id = nil
      expect(@help).to_not be_valid
    end

    it 'ensures that user_id is a number' do
      @help.user_id = 'a'
      expect(@help).to_not be_valid
      end

    it 'ensures that user_id is a positive number' do
      @help.user_id = -1
      expect(@help).to_not be_valid
    end
  end
end