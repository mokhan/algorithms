  class TotalCountVisitor
    attr_reader :result

    def initialize
      @result = 0
    end

    def visit(item)
      @result += 1
    end
  end
