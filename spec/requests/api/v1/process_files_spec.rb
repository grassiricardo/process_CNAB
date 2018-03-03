require 'rails_helper'

RSpec.describe 'Request Process Files', type: :request do
  describe 'GET /api/v1/process_cnab' do
    context 'authorized request' do
      before { get '/api/v1/process_cnab' }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /api/v1/transactions' do
    context 'unautorized request' do
      before { get '/api/v1/transactions' }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    context 'authorized request' do
      let!(:process_file_credito) { create(:process_file, type_transaction: 1) }
      let!(:process_file_debito) { create(:process_file, type_transaction: 4) }

      before do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        get '/api/v1/transactions', params: {}, headers: auth_headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the transactions createds' do
        expect(JSON.parse(response.body).count).to eq(2)
      end
    end

    context 'with param type_transaction' do
      let!(:process_file_credito) { create(:process_file, type_transaction: 1) }
      let!(:process_file_debito) { create(:process_file, type_transaction: 4) }

      before do
        user = create(:user)
        auth_headers = user.create_new_auth_token
        get '/api/v1/transactions', params: { type_transaction: 1 }, headers: auth_headers
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the transactions createds' do
        expect(JSON.parse(response.body).count).to eq(1)
      end
    end
  end
end
