# RubyweeklyScrapper

Scrapper for https://rubyweekly.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyweekly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyweekly

## Usage

```ruby
RubyweeklyScrapper.scrap_index("https://rubyweekly.com/issues") #=> [#<struct RubyweeklyScrapper::IssueLink url="https://rubyweekly.com/issues/415", date=#<Date: 2018-09-06 ((2458368j,0s,0n),+0s,2299161j)>>, ...]
```

```ruby
RubyweeklyScrapper.scrap_issue("https://rubyweekly.com/issues/414") #=> [#<struct RubyweeklyScrapper::Post title="Senior/Lead Ruby Developer - Nimbl3, Bangkok (Relocation Support)", description="— Join Nimbl3 to work on large-scale software development projects. We use top-notch technology, follow best practices and have fun.", publisher="Nimbl3", url="https://rubyweekly.com/link/52089/web">, ...]
```
