# frozen_string_literal: true

RSpec.describe RubyweeklyScrapper do
  it "has a version number" do
    expect(RubyweeklyScrapper::VERSION).not_to be nil
  end

  describe ".scrap_index" do
    context "when no argument passed" do
      it "calls ScrapIndex with https://rubyweekly.com/issues" do
        links = double(:links)

        expect_any_instance_of(RubyweeklyScrapper::ScrapIndex)
          .to receive(:call).with(url: "https://rubyweekly.com/issues").and_return(links)

        expect(described_class.scrap_index).to eq links
      end
    end

    context "when url passed" do
      it "calls ScrapIndex with passed url" do
        links = double(:links)
        url = "https://example.com"

        expect_any_instance_of(RubyweeklyScrapper::ScrapIndex)
          .to receive(:call).with(url: url).and_return(links)

        expect(described_class.scrap_index(url)).to eq links
      end
    end
  end

  describe ".scrap_issue" do
    it "calls ScrapIssue" do
      posts = double(:posts)
      url = "https://example.com"

      expect_any_instance_of(RubyweeklyScrapper::ScrapIssue)
        .to receive(:call).with(url: url).and_return(posts)

      expect(described_class.scrap_issue(url)).to eq posts
    end
  end
end
