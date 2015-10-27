class INE::Places::ProvincesCollection
  include Singleton

  def self.records
    @records ||= CSV.read("#{INE::Places::ROOT}/data/provinces.csv", headers: true).map do |raw_data|
                   build_from_raw_data(raw_data)
                 end.sort_by(&:slug)
  end

  def self.build_from_raw_data(raw_data)
    INE::Places::Province.new({
      id: raw_data[0], name: raw_data[2],
      slug: raw_data[3], autonomous_region_id: raw_data[1],
      lon: raw_data[4], lat: raw_data[5],
      autonomous_region: INE::Places::AutonomousRegion.find(raw_data[1])
    })
  end
  private_class_method :build_from_raw_data

end
