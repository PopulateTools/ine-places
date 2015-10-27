require 'spec_helper'

describe INE::Places::AutonomousRegion do
  it_should_behave_like "CSVRecord object"

  it 'returns a list of the provinces on it' do
    ar = INE::Places::AutonomousRegion.find('1')

    expect(ar.provinces).not_to be_empty
    expect(ar.provinces.first).to be_kind_of(INE::Places::Province)
    expect(ar.provinces.all?{ |p| p.autonomous_region_id == ar.id }).to be true
  end
end
