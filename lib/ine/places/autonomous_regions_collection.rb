class INE::Places::AutonomousRegionsCollection
  include Singleton

  def self.records
    @records ||= CSV.read("#{INE::Places::ROOT}/data/autonomous_regions.csv", headers: true).map do |raw_data|
                   build_from_raw_data(raw_data)
                 end.sort_by(&:slug)
  end

  def self.build_from_raw_data(raw_data)
    INE::Places::AutonomousRegion.new({
      id: raw_data[0], name: raw_data[1], slug: raw_data[2],
      lon: raw_data[3], lat: raw_data[4]
    })
  end
  private_class_method :build_from_raw_data

end
