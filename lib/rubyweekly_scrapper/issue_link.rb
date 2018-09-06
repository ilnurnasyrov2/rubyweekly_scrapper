# frozen_string_literal: true

module RubyweeklyScrapper
  class IssueLink
    attr_reader :url, :date

    def initialize(url:, date:)
      @url = url.dup.freeze
      @date = date.dup.freeze
    end

    def ==(other)
      url == other.url && date == other.date
    end
  end
end
