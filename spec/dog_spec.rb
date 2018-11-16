describe 'https://dog.ceo/api' do
  let!(:base_url) { 'https://dog.ceo/api' }
  let!(:connection) do
    Faraday.new(url: base_url) do |faraday|
      faraday.request :json
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  context '/breeds/list/all' do
    let!(:endpoint) { 'breeds/list/all' }
    let!(:response) { connection.get endpoint }

    it 'responds with a 200 Success' do
      expect(response.status).to eq 200
    end
  end
end
