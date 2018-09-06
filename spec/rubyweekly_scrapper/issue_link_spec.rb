# frozen_string_literal: true

require "spec_helper"

RSpec.describe RubyweeklyScrapper::IssueLink do
  describe "#==" do
    it "compares all fields" do
      link = RubyweeklyScrapper::IssueLink.new(
        date: "date",
        url: "url"
      )

      copy = RubyweeklyScrapper::IssueLink.new(
        date: "date",
        url: "url"
      )

      another_link = RubyweeklyScrapper::IssueLink.new(
        date: "date",
        url: "another url"
      )

      expect(copy).to eq link
      expect(another_link).not_to eq link
    end
  end
end
