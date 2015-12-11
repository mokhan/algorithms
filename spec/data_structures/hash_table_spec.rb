require "spec_helper"

describe HashTable do
  subject { HashTable.new }

  it "returns a default value" do
    expect(subject[:unkonwn]).to be_nil
  end

  it "can return the value associated to a key" do
    subject[:name] = 'mo'
    expect(subject[:name]).to eq('mo')
  end
end
