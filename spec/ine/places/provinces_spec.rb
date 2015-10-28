require 'spec_helper'

describe INE::Places::Province do
  it_should_behave_like "CSVRecord object"

  it 'returns a list of the places on it' do
    p = INE::Places::Province.all.first

    expect(p.places).not_to be_empty
    expect(p.places.first).to be_kind_of(INE::Places::Place)
    expect(p.places.all?{ |place| place.province_id == p.id }).to be true
  end

  it 'can load all the provinces of an autonomous region' do
    autonomous_region_id = INE::Places::AutonomousRegion.all.first.id
    provinces = INE::Places::Province.find_all_by_autonomous_region_id(autonomous_region_id)

    expect(provinces).not_to be_empty
    expect(provinces.first).to be_kind_of(INE::Places::Province)
    expect(provinces.all?{ |province| province.autonomous_region_id == autonomous_region_id }).to be true
  end

  it 'raises ArgumentError if #find_all_by_autonomous_region_id parameter is missing' do
    expect { described_class.find_all_by_autonomous_region_id() }.to raise_error(ArgumentError)
  end

end
