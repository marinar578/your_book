require "rails_helper"

RSpec.describe LibraryLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/library_locations").to route_to("library_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/library_locations/new").to route_to("library_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/library_locations/1").to route_to("library_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/library_locations/1/edit").to route_to("library_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/library_locations").to route_to("library_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/library_locations/1").to route_to("library_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/library_locations/1").to route_to("library_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/library_locations/1").to route_to("library_locations#destroy", :id => "1")
    end

  end
end
