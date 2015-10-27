class INE::Places::PlacesCollection
  include Singleton

  def self.records
    @records ||= CSV.read("#{INE::Places::ROOT}/data/places.csv", headers: true).map do |raw_data|
                   build_from_raw_data(raw_data)
                 end.sort_by(&:slug)
  end

  def self.build_from_raw_data(raw_data)
    INE::Places::Place.new({
      id: raw_data[0], name: raw_data[2],
      slug: raw_data[3], province_id: raw_data[1],
      lon: raw_data[6], lat: raw_data[7],
      province: INE::Places::Province.find(raw_data[1])
    })
  end
  private_class_method :build_from_raw_data

end
