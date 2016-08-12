describe Tutorial::Hello do
  include Rack::Test::Methods

  let(:app) { Tutorial::API }
  let(:url) { '/api/v1/hello' }
  let(:content_type) { 'application/json' }
  let(:valid_headers) { { 'Accept' => content_type, 'Content-Type' => content_type } }
  let(:valid_params) { {} }

  context 'GET /api/v1/hello/' do
    context 'success' do
      before { get url, valid_params, valid_headers }

      let(:correct_response) { { 'message' => 'Hello world' } }

      it { expect(last_response.status).to eq(200) }
      it { expect(JSON.parse(last_response.body)).to eq (correct_response) }
    end

    context 'wrong content type' do
      let(:content_type) { 'elo elo' }
      let(:headers) { { 'Accept' => content_type, 'Content-Type' => content_type } }

      before { get url, valid_params, headers }
      # not working too
      # before do
      #   header 'Accept', content_type
      #   header 'Content-Type', content_type
      #   get url, valid_params
      # end

      let(:correct_response) { { 'error' => "Wrong content type, or something?" } }

      it { expect(last_response.status).to eq(406) }
      it { expect(JSON.parse(last_response.body)).to eq (correct_response) }
    end
  end
end
