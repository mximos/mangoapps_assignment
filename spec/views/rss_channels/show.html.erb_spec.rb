require 'rails_helper'

RSpec.describe "rss_channels/show", type: :view do
  before(:each) do
    @rss_channel = assign(:rss_channel, RssChannel.create!(
      :name => "Name",
      :feed_url => "Feed Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Feed Url/)
  end
end
