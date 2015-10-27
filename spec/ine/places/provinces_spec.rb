require 'spec_helper'

describe INE::Places::Province do
  it_should_behave_like "CSVRecord object"

  it 'returns a list of the places on it' do
    p = INE::Places::Province.find('1')

    expect(p.places).not_to be_empty
    expect(p.places.first).to be_kind_of(INE::Places::Place)
    expect(p.places.all?{ |place| place.province_id == p.id }).to be true
  end
end
