# frozen_string_literal: true

require "open-uri"
require "uri"
require "nokogiri"

class RubyweeklyScrapper::ScrapIndex
  def call(url:)
    document = Nokogiri::HTML(open(url))

    document.css(".issue").map do |issue|
      issue_url = URI(url)
      issue_url.path = "/" + issue.css('a').attribute("href").value
      date = Date.parse(issue.text[13..-1])

      RubyweeklyScrapper::IssueLink.new(date: date, url: issue_url.to_s)
    end
  end
end
