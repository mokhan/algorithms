require "spec_helper"

describe HashTable do
  let(:sut) { HashTable.new }

  it "returns a default value" do
    expect(sut[:unkonwn]).to be_nil
  end

  it "can return the value associated to a key" do
    sut[:name] = 'mo'
    expect(sut[:name]).to eq('mo')
  end
end
