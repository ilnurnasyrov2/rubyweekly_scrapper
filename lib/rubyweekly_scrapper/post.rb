# frozen_string_literal: true

module RubyweeklyScrapper
  class Post
    attr_reader :title, :description, :publisher, :url, :type

    def initialize(title:, description:, publisher:, url:, type:)
      @title = title.dup.freeze
      @description = description.dup.freeze
      @publisher = publisher.dup.freeze
      @url = url.dup.freeze
      @type = type.dup.freeze
    end

    def ==(other)
      title == other.title &&
        description == other.description &&
        publisher == other.publisher &&
        url == other.url &&
        type == other.type
    end
  end
end
