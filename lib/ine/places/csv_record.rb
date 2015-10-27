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
      collection_klass.records.detect{|obj| obj.name == name } if name.present?
    end

    def find_by_slug(slug)
      collection_klass.records.detect{|obj| obj.slug == slug } if slug.present?
    end

    def find(id)
      collection_klass.records.detect{|obj| obj.id == id } if id.present?
    end
  end
end
