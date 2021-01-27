include TokenHelper

describe 'Chat' do
  before do
    user = FactoryBot.create(:user, {email: 'newuser@email.com', first_name: 'new', last_name: 'user'})
    category = FactoryBot.create :category
    @help = FactoryBot.create(:help, {
      title: 'This title',
      description: 'This is a very good description',
      category_id: category.id,
      user_id: user.id,
      location: '23.8, 109.02'
    })
  end
  
  
  it 'saves message to database' do
    @user = FactoryBot.create(:user)
    @token = TokenHelper.generate(@user)
    post '/api/v1/chats', params: {message: 'hello', help_id: @help.id, user_id: @user.id} , headers: {'Authorization': 'Bearer ' + @token}
    expect(response).to have_http_status :created
    expect(JSON.parse(response.body).keys).to include("message", "user")
  end
end