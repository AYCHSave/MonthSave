require 'rails_helper'

RSpec.describe "Projects::Accounts", type: :request do
  describe "GET /projects_accounts" do
    it "works! (now write some real specs)" do
      get projects_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end
