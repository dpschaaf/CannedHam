require 'rails_helper'

RSpec.describe "Metals", type: :request do
  describe "GET /metals" do
    it "works! (now write some real specs)" do
      get metals_path
      expect(response).to have_http_status(200)
    end
  end
end
