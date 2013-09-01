require "spec_helper"
class FizzBuzz
  def print(item, printer)
    printer << "Fizz" if fizzy?(item)
    printer << "Buzz" if buzzy?(item)
    #printer << item unless fizzy?(item) || buzzy?(item)
    printer << item if printer.string == ""
  end

  def fizzy?(item)
    (item % 3) == 0
  end

  def buzzy?(item)
    (item % 5) == 0
  end
end

describe FizzBuzz do
  let(:sut) { FizzBuzz.new }
  let(:printer) { StringIO.new }

  it "should return Fizz for multiples of 3" do
    sut.print(3, printer)
    printer.string.should == "Fizz"
  end

  it "should return Buzz for multiples of 5" do
    sut.print(5, printer)
    printer.string.should == "Buzz"
  end

  it "should return FizzBuzz for multiples of 3 and 5" do
    sut.print(15, printer)
    printer.string.should == "FizzBuzz"
  end

  it "should return the number for everything else" do
    sut.print(16, printer)
    printer.string.should == "16"
  end
end