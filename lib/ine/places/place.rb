class INE::Places::Place < OpenStruct
  include INE::Places::CSVRecord

  def self.find_all_by_province_id(province_id)
    raise ArgumentError if province_id.blank?

    collection_klass.records.select{ |place| place.province_id == province_id }
  end

  def self.find_by_name_and_province_id(place_name, province_id)
    raise ArgumentError if place_name.blank? || province_id.blank?

    collection_klass.records.select{ |place| place.name == place_name && place.province_id == province_id.to_s }.first
  end

  def data
    @data ||= OpenStruct.new
  end

  def population(year)
    dataset_file_path = File.expand_path("../data/padron_#{year}.px", __FILE__)
    unless File.file?(dataset_file_path)
      return nil
    end
    dataset = RubyPx::Dataset.new(dataset_file_path)
    dataset.data('edad (año a año)' => 'Total', 'sexo' => 'Ambos sexos')
    debugger
  end

  private

  def self.collection_klass
    INE::Places::PlacesCollection
  end

  def self.filter(records, name)
    return [] if name.blank?
    parameterized_name = name.parameterize

    records.select{|p| p.slug.include?(parameterized_name) }.
      reject{|p| ['ceuta','melilla'].include?(p.slug) }.
      sort_by{|p| p.province.slug }
  end
end
