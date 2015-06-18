require 'support/animal_properties_context'

shared_examples 'it has properties' do

  include_context 'Animal Properties'

  it 'has properties' do
    expect(subject.properties).to eq(properties)
  end

  it 'checks for the existence of all specific properties' do
    expect(subject.has_all_properties?(small, grey)).to be(true)
    expect(subject.has_all_properties?(hairy, small)).to be(false)
  end

  it 'checks for the existence of any specific properties' do
    expect(subject.has_any_properties?(small)).to be(true)
    expect(subject.has_any_properties?(hairy, small)).to be(true)
  end
end
