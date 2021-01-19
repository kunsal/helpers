describe 'Chat' do
  context 'Action cable' do
    it 'should get /cable and return 200' do
      expect(subscription).to have_stream_from('chat_1')
    end
  end
end