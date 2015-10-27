require "ine/places/version"
require "csv"
require "ostruct"
require "active_support/all"

module INE
  module Places
    ROOT = File.expand_path('../', __FILE__)

    def self.preload
      AutonomousRegionsCollection.records
      ProvincesCollection.records
      PlacesCollection.records

      nil
    end
  end
end

require "ine/places/csv_record"
require "ine/places/autonomous_region"
require "ine/places/autonomous_regions_collection"
require "ine/places/province"
require "ine/places/provinces_collection"
require "ine/places/place"
require "ine/places/places_collection"
