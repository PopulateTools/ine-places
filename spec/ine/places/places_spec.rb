require 'spec_helper'

describe INE::Places do
  it 'has a version number' do
    expect(INE::Places::VERSION).not_to be nil
  end

  it 'preloads the data' do
    expect(INE::Places.preload).to be nil
  end
end
