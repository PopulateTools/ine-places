require "ine/places/version"
require "csv"
require "ostruct"
require "active_support/all"
require "open-uri"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem

class INEInflector < Zeitwerk::Inflector
  def camelize(basename, _abspath)
    case basename
    when "csv_record"
      "CSVRecord"
    when "ine"
      "INE"
    else
      super
    end
  end
end

loader.inflector = INEInflector.new
loader.setup

module INE
  module Places
    ROOT = File.expand_path('../ine/places/', __FILE__)

    def self.preload
      AutonomousRegionsCollection.records
      ProvincesCollection.records
      PlacesCollection.records

      nil
    end

    def self.hydratate(klass, data_path, options)
      data = CSV.read(open(data_path), headers: true)

      data.each do |row|
        if obj = klass.find(row[options[:id_column]])
          value = row[options[:value_column]]
          case options[:convert_to]
          when :float
            value = value.to_f
          when :integer, :int
            value = value.to_i
          end

          obj.data.send((options[:as].to_s + '=').to_sym, value)
        end
      end

      nil
    end
  end
end
