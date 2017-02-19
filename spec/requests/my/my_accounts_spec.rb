require 'rails_helper'

RSpec.describe "My::Accounts", type: :request do
  describe "GET /my_accounts" do
    it "works! (now write some real specs)" do
      get my_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end
