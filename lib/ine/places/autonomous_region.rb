class INE::Places::AutonomousRegion < OpenStruct
  include INE::Places::CSVRecord

  def provinces
    INE::Places::Province.find_all_by_autonomous_region_id(self.id)
  end

  private

  def self.collection_klass
    INE::Places::AutonomousRegionsCollection
  end

  def self.filter(records, name)
    return [] if name.blank?
    parameterized_name = name.parameterize

    records.select{|a| a.slug.include?(parameterized_name) }.
      sort_by{|a| a.name.parameterize }
  end
end
