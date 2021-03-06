require "spec_helper"

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n-1)
  end
end

def fibonacci(n)
  n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci_enumerator
  Enumerator.new do |yielder|
    i, j = 0, 1
    loop do
      i, j = j, i + j
      yielder.yield i
    end
  end
end

describe "fibonacci" do
  let(:sut) { Fibonacci.new }

  xit "should return the correct result" do
    #0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
    expect(sut.get(0)).to eq(0)
    expect(sut.get(1)).to eq(1)
  end

  it "should return the first n numbers in fibonacci" do
    f = ->(x){ x < 2 ? x : f.call(x-1) + f.call(x-2) }
    20.times do |n|
      expect(fibonacci(n)).to eq(f.call(n))
    end
  end

  it "can enumerate forever" do
    fibonacci_enumerator.take_while { |n| n < 1000 }
  end

  it "can do factorial" do
    (1..10).each do |n|
      expect(factorial(n)).to eq((1..n).inject { |total, i| (i) * total })
    end
  end
end
