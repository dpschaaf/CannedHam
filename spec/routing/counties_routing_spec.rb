require "rails_helper"

RSpec.describe CountiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/counties").to route_to("counties#index")
    end

    it "routes to #new" do
      expect(:get => "/counties/new").to route_to("counties#new")
    end

    it "routes to #show" do
      expect(:get => "/counties/1").to route_to("counties#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/counties/1/edit").to route_to("counties#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/counties").to route_to("counties#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/counties/1").to route_to("counties#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/counties/1").to route_to("counties#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/counties/1").to route_to("counties#destroy", :id => "1")
    end

  end
end
