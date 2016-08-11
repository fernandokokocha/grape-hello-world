require 'spec_helper'
require_relative '../tutorial'

describe Tutorial::API do
  include Rack::Test::Methods

  def app
    Tutorial::API
  end

  context 'GET /api/v1/hello/' do
    it 'returns something' do
      get '/api/v1/hello'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq ({ 'message' => 'Hello world' })
    end
  end
end
