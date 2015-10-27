class INE::Places::Place < OpenStruct
  include INE::Places::CSVRecord

  def self.find_all_by_province_id(province_id)
    return [] if province_id.blank?

    collection_klass.records.select{ |place| place.province_id == province_id }
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
