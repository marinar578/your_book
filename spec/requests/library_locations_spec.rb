require 'rails_helper'

RSpec.describe "LibraryLocations", type: :request do
  describe "GET /library_locations" do
    it "works! (now write some real specs)" do
      get library_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
