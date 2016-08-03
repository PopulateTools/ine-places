module INE::Places::CSVRecord
  extend ::ActiveSupport::Concern

  def to_param
    self.slug
  end

  class_methods do

    def all
      collection_klass.records
    end

    def find_by_name(name)
      raise ArgumentError if name.blank?

      records_by_name[name]
    end

    def find_by_slug(slug)
      raise ArgumentError if slug.blank?

      records_by_slug[slug]
    end

    def find(id)
      raise ArgumentError if id.blank?

      records_by_id[id.to_i]
    end

    private

    def records_by_id
      @records_by_id ||= Hash[collection_klass.records.map{ |record| [record.id.to_i, record] }]
    end

    def records_by_slug
      @records_by_slug ||= Hash[collection_klass.records.map{ |record| [record.slug, record] }]
    end

    def records_by_name
      @records_by_name ||= Hash[collection_klass.records.map{ |record| [record.name, record] }]
    end
  end
end
