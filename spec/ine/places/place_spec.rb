require 'spec_helper'

describe INE::Places::Place do
  it_should_behave_like "CSVRecord object"

  it 'can load all the places of a province' do
    province_id = INE::Places::Province.all.first.id
    places = INE::Places::Place.find_all_by_province_id(province_id)

    expect(places).not_to be_empty
    expect(places.first).to be_kind_of(INE::Places::Place)
    expect(places.all?{ |place| place.province_id == province_id }).to be true
  end

  it 'can load a record by name and province_id' do
    province = INE::Places::Province.find_by_name('Cáceres')
    place = INE::Places::Place.find_by_name_and_province_id("Arroyomolinos", province.id)

    expect(place.id).to eq "10023"

    province = INE::Places::Province.find_by_name('Madrid')
    place = INE::Places::Place.find_by_name_and_province_id("Arroyomolinos", province.id)

    expect(place.id).to eq "28015"
  end

  it 'raises ArgumentError if #find_all_by_province_id parameter is missing' do
    expect { described_class.find_all_by_province_id() }.to raise_error(ArgumentError)
  end
end
