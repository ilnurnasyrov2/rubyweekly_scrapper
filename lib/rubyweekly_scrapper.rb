# frozen_string_literal: true

module RubyweeklyScrapper
  require_relative "rubyweekly_scrapper/version"
  require_relative "rubyweekly_scrapper/scrap_index"
  require_relative "rubyweekly_scrapper/scrap_issue"
  require_relative "rubyweekly_scrapper/post"
  require_relative "rubyweekly_scrapper/issue_link"

  def self.scrap_index(url = "https://rubyweekly.com/issues")
    RubyweeklyScrapper::ScrapIndex.new.call(url: url)
  end

  def self.scrap_issue(url)
    RubyweeklyScrapper::ScrapIssue.new.call(url: url)
  end
end
