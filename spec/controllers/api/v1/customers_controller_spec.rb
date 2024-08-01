require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe 'POST #create' do
    let(:file) { fixture_file_upload('files/customers.txt', 'text/plain') }

    it 'returns the correct customers' do
      post :create, params: { file: file }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json).to be_an(Array)
      expect(json.map { |c| c['name'] }).to contain_exactly('Aarav Patel', 'Vivaan Sharma', 'Aditya Mehra')
      expect(json.map { |c| c['user_id'] }).to include(1, 2, 3)
    end
  end
end
