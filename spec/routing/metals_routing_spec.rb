require "rails_helper"

RSpec.describe MetalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/metals").to route_to("metals#index")
    end

    it "routes to #new" do
      expect(:get => "/metals/new").to route_to("metals#new")
    end

    it "routes to #show" do
      expect(:get => "/metals/1").to route_to("metals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/metals/1/edit").to route_to("metals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/metals").to route_to("metals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/metals/1").to route_to("metals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/metals/1").to route_to("metals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/metals/1").to route_to("metals#destroy", :id => "1")
    end

  end
end
