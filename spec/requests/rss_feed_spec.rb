require 'rails_helper'

RSpec.describe "RssChannels", type: :request do
  describe "GET /rss_channels" do
    it "works! (now write some real specs)" do
      get rss_channels_path
      expect(response).to have_http_status(200)
    end
  end
end
