require "geocoder/lookups/base"
require "geocoder/lookups/google"
require "geocoder/results/google"

module Geocoder::Lookup
  class Dstk < Google
    private # ---------------------------------------------------------------

    def query_url(query, reverse = false)
      params = {
        (reverse ? :latlng : :address) => query,
        :sensor => "false",
        :language => Geocoder::Configuration.language,
        :key => Geocoder::Configuration.api_key
      }
      "#{protocol}://#{Geocoder::Configuration.dstk_url}/maps/api/geocode/json?" + hash_to_query(params)
    end
  end
end