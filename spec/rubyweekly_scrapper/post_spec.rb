# frozen_string_literal: true

require "spec_helper"

RSpec.describe RubyweeklyScrapper::Post do
  describe "#==" do
    it "compares all fields" do
      post = RubyweeklyScrapper::Post.new(
        title: "title",
        description: "description",
        publisher: "publisher",
        url: "url",
        type: "type",
      )

      copy = RubyweeklyScrapper::Post.new(
        title: "title",
        description: "description",
        publisher: "publisher",
        url: "url",
        type: "type",
      )

      another_post = RubyweeklyScrapper::Post.new(
        title: "another_title",
        description: "description",
        publisher: "publisher",
        url: "url",
        type: "type",
      )

      expect(copy).to eq post
      expect(another_post).not_to eq post
    end
  end
end
