require "ine/places/version"
require "csv"
require "ostruct"
require "active_support/all"
require "byebug"

module INE
  module Places

    require "ine/places/csv_record"
    require "ine/places/autonomous_region"
    require "ine/places/autonomous_regions_collection"
    require "ine/places/province"
    require "ine/places/provinces_collection"
    require "ine/places/place"
    require "ine/places/places_collection"

    ROOT = File.expand_path('../places/', __FILE__)

    def self.preload
      AutonomousRegionsCollection.records
      ProvincesCollection.records
      PlacesCollection.records

      nil
    end

    def self.hydratate(klass, data_path, options)
      unless File.file?(data_path)
        raise "Missing data file: #{data_path}"
      end

      data = CSV.read(data_path, headers: true)
      klass.all.map do |obj|
        obj.tap do
          value = if r = data.detect{|row| row[options[:id_column]] == obj.id }
                    r[options[:value_column]]
                  end
          obj.data.send((options[:as].to_s + '=').to_sym, value)
        end
      end
    end
  end
end
