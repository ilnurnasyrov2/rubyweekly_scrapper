# frozen_string_literal: true

require "spec_helper"
require "rubyweekly_scrapper"

RSpec.describe RubyweeklyScrapper::ScrapIndex do
  let(:url) { "https://rubyweekly.com/issues" }

  use_cassette "rubyweekly_scrapper/scrap_index"

  it "returns links to issues" do
    links = RubyweeklyScrapper::ScrapIndex.new.call(url: url)

    expect(links).to be_an Array
    expect(links.count).to be > 225

    link = links.first

    expect(link.url).to eq "https://rubyweekly.com/issues/415"
    expect(link.date).to eq Date.new(2018, 9, 6)
  end
end
