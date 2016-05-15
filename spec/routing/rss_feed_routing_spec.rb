require "rails_helper"

RSpec.describe RssChannelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rss_channels").to route_to("rss_channels#index")
    end

    it "routes to #new" do
      expect(:get => "/rss_channels/new").to route_to("rss_channels#new")
    end

    it "routes to #show" do
      expect(:get => "/rss_channels/1").to route_to("rss_channels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rss_channels/1/edit").to route_to("rss_channels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rss_channels").to route_to("rss_channels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rss_channels/1").to route_to("rss_channels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rss_channels/1").to route_to("rss_channels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rss_channels/1").to route_to("rss_channels#destroy", :id => "1")
    end

  end
end
