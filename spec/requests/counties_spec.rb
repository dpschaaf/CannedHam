require 'rails_helper'

RSpec.describe "Counties", type: :request do
  describe "GET /counties" do
    it "works! (now write some real specs)" do
      get counties_path
      expect(response).to have_http_status(200)
    end
  end
end
