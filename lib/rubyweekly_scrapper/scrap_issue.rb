# frozen_string_literal: true

require "open-uri"
require "uri"
require "nokogiri"

class RubyweeklyScrapper::ScrapIssue
  def call(url:)
    document = Nokogiri::HTML(URI.open(url))

    type = "general"

    posts =
    document.css(".el-heading, .el-item.item").map do |item|
      if item.attribute("class").value.include?("el-heading")
        type = sanitize_type(item.text)
        next
      end

      desc = item.css(".desc")
      name = item.css(".name")

      publisher = name.text
      url = desc.css("a").attribute("href").value
      title = desc.css("a").first.text
      description = desc.children[1..-1].to_s

      RubyweeklyScrapper::Post.new(
        title: sanitize_string(title),
        description: sanitize_string(description),
        url: url,
        publisher: sanitize_string(publisher),
        type: type
      )
    end

    posts.compact
  end

  def sanitize_string(value)
    value.dup.force_encoding('utf-8').strip
  end

  def sanitize_type(value)
    sanitize_string(value).scan(/[\w\ \&]+/).join
  end
end
