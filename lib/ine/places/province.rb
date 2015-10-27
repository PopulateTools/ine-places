class INE::Places::Province < OpenStruct
  include INE::Places::CSVRecord

  def self.find_all_by_autonomous_region_id(autonomous_region_id)
    return [] if autonomous_region_id.blank?

    collection_klass.records.select{ |province| province.autonomous_region_id == autonomous_region_id }
  end

  def places
    INE::Places::Place.find_all_by_province_id(self.id)
  end

  private

  def self.collection_klass
    INE::Places::ProvincesCollection
  end

  def self.filter(records, name)
    return [] if name.blank?
    parameterized_name = name.parameterize

    records.select{|p| p.slug.include?(parameterized_name) }.
      reject{|p| ['ceuta','melilla'].include?(p.slug) }.
      sort_by{|p| p.autonomous_region.slug }
  end
end
