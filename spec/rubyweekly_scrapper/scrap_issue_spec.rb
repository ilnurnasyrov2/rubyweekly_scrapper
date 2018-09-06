# frozen_string_literal: true

require "spec_helper"
require "rubyweekly_scrapper"

RSpec.describe RubyweeklyScrapper::ScrapIssue do
  let(:url) { "https://rubyweekly.com/issues/414" }

  use_cassette "rubyweekly_scrapper/scrap_issue"

  it "returns posts" do
    posts = RubyweeklyScrapper::ScrapIssue.new.call(url: url)

    expect(posts).to be_an Array
    expect(posts.count).to eq 27

    expect(posts.first).to eq RubyweeklyScrapper::Post.new(
      title: "Rails.. Still? Plus Some Ruby Metaprogramming",
      description: "— Thoughts on two talks given at the Amsterdam.rb meetup earlier this week. The first reflecting on Ruby webapp frameworks, and the second covering <em>metaprogramming for generalists</em> - <a target=\"_blank\" href=\"https://rubyweekly.com/link/52080/web\" style=\"text-decoration: none; color: #0055bb; border-bottom-width: 1px !important; border-bottom-color: #ddd !important; border-bottom-style: solid !important;\">you can watch the Euruko version here.</a>",
      publisher: "Floor Drees (Phusion)",
      url: "https://rubyweekly.com/link/52079/web",
      type: "general"
    )

    post1, post2, post3 = posts.select { |post| post.type.downcase == "jobs" }

    expect(post1).to eq RubyweeklyScrapper::Post.new(
      title: "Senior/Lead Ruby Developer - Nimbl3, Bangkok (Relocation Support)",
      url: "https://rubyweekly.com/link/52089/web",
      publisher: "Nimbl3",
      description: "— Join Nimbl3 to work on large-scale software development projects. We use top-notch technology, follow best practices and have fun.",
      type: "Jobs"
    )

    expect(post2).to eq RubyweeklyScrapper::Post.new(
      title: "Principal Software Engineer - Edinburgh or Remote (UK)",
      url: "https://rubyweekly.com/link/52090/web",
      publisher: "FreeAgent",
      description: "— Running on Rails since 2006, FreeAgent are hiring experienced Rubyists to lead architectural design, refactoring, and mentoring.",
      type: "Jobs"
    )

    expect(post3).to eq RubyweeklyScrapper::Post.new(
      title: "Find A Ruby Job Through Vettery",
      url: "https://rubyweekly.com/link/52109/web",
      publisher: "Vettery",
      description: "— Create a profile to connect with inspiring companies seeking Ruby devs.",
      type: "Jobs"
    )
  end
end
