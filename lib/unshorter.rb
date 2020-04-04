# frozen_string_literal: true

require "uri"
require "net/http"

class Unshorter
  attr_reader :max_level

  def initialize(max_level = 5)
    @max_level = max_level
  end

  def call(url)
    url = "http://#{url}" if url !~ %r{^(http|https)://}
    original_uri = uri = URI(url)
    max_level.times do
      response = Net::HTTP.get_response(uri)

      if %w[301 302].include?(response.code)
        uri = URI(response["location"])
        next
      end

      if original_uri.host.sub(/www\./, "") == uri.host
        break response.body.scan(%r{location=['|"]([a-z:/\.\d]+)['|"]}).flatten.fetch(0, nil)
      end

      break uri.to_s
    end
  end
end
