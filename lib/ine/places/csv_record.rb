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

      collection_klass.records.detect{|obj| obj.name == name }
    end

    def find_by_slug(slug)
      raise ArgumentError if slug.blank?

      collection_klass.records.detect{|obj| obj.slug == slug }
    end

    def find(id)
      raise ArgumentError if id.blank?

      collection_klass.records.detect{|obj| obj.id == id }
    end
  end
end
