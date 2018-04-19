describe 'https://dog.ceo/api' do
  before(:all) do
    @conn = Faraday.new(url: 'https://dog.ceo/api') do |faraday|
      faraday.request :json
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  context '/breeds/list/all' do
    before(:all) do
      endpoint = 'breeds/list/all'
      @response = @conn.get endpoint
    end

    it 'responds with a 200 Success' do
      expect(@response.status).to eq 200
    end
  end
end
