require 'spec_helper'

RSpec.shared_examples "CSVRecord object" do

  it 'can load all the records from the collection' do
    records = described_class.all

    expect(records).to be_kind_of(Array)
    expect(records.first).to be_kind_of(described_class)
  end

  it 'can load a record by name' do
    name = described_class.all.first.name
    record = described_class.find_by_name(name)

    expect(record).to be_kind_of(described_class)
    expect(record.name).to eql(name)
  end

  it 'raises Argument error when #find_by_name argument is missing' do
    expect { described_class.find_by_name() }.to raise_error(ArgumentError)
  end

  it 'can load a record by slug' do
    slug = described_class.all.first.slug
    record = described_class.find_by_slug(slug)

    expect(record).to be_kind_of(described_class)
    expect(record.slug).to eql(slug)
  end

  it 'raises Argument error when #find_by_slug argument is missing' do
    expect { described_class.find_by_slug() }.to raise_error(ArgumentError)
  end

  it 'can be loaded by an id' do
    id = described_class.all.first.id
    record = described_class.find(id)

    expect(record).to be_kind_of(described_class)
    expect(record.id).to eql(id)
  end

  it 'raises Argument error when #find_by_id argument is missing' do
    expect { described_class.find() }.to raise_error(ArgumentError)
  end

end
