require 'spec_helper'

describe INE::Places do
  it 'has a version number' do
    expect(INE::Places::VERSION).not_to be nil
  end

  it 'preloads the data' do
    expect(INE::Places.preload).to be nil
  end

  describe 'hydratate entities with external data' do
    context 'when the entity is in the data' do
      it 'should load data to entities based on a local file' do
        INE::Places.hydratate INE::Places::Place, 'spec/fixtures/happiness.csv', id_column: 'municipio', as: :happiness, value_column: 'value'
        place = INE::Places::Place.find_by_slug 'madrid'
        expect(place.data.happiness).to eq('33')
      end
    end

    context 'when the entity is not in the data' do
      it 'should respond to the method and return nil' do
        INE::Places.hydratate INE::Places::Place, 'spec/fixtures/happiness.csv', id_column: 'municipio', as: :happiness, value_column: 'value'
        place = INE::Places::Place.find_by_slug 'aranjuez'
        expect(place.data.happiness).to be_nil
      end
    end
  end
end
