# frozen_string_literal: true

def use_cassette(name, options = {})
  options[:record] ||= :once
  options[:match_requests_on] ||= %i[method uri body path headers]

  around do |example|
    VCR.use_cassette(name, options) do
      example.run
    end
  end
end
