require "spec_helper"

describe HashTable do
  let(:sut) { HashTable.new }

  it "returns a default value" do
    sut[:unkonwn].should be_nil
  end

  it "can return the value associated to a key" do
    sut[:name] = 'mo'
    sut[:name].should == 'mo'
  end
end
