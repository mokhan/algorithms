require "spec_helper"

describe "problem eleven" do
=begin
In the 20×20 grid below, four numbers along a diagonal line have been marked in red.

  |0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19
============================================================
00|08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
01|49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
02|81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
03|52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
04|22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
05|24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
06|32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
07|67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
08|24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
09|21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
10|78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
11|16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
12|86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
13|19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
14|04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
15|88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
16|04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
17|20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
18|20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
19|01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48

The product of these numbers is 26 × 63 × 78 × 14 = 1788696.

  What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

## design

### build a grid (brute force)

 [
  [08, 02, 22, 97, 38, 15, 00, 40, 00, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 08],
  [49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00],
 ]

### build a graph
#
  do a traversal through the graph
  compute the largest product from each node

   08 - 49
  /  \
 02  49
=end

  class Heading
    attr_reader :grid

    def initialize(grid)
      @grid = grid
    end

    def max_product(digits, cell)
      next_cell = next_cell(cell)
      return cell.value if next_cell.nil?
      cell.value * max_product(digits - 1, next_cell)
    end
  end

  class North < Heading
    def initialize(*args); super; end
    def next_cell(cell)
      grid.cell_at(x: cell.x - 1, y: cell.y)
    end
  end
  class South < Heading
    def initialize(*args); super; end
    def next_cell(cell)
      grid.cell_at(x: cell.x + 1, y: cell.y)
    end
  end
  class East < Heading
    def initialize(*args); super; end
    def next_cell(cell)
      grid.cell_at(x: cell.x, y: cell.y + 1)
    end
  end
  class West < Heading
    def initialize(*args); super; end
    def next_cell(cell)
      grid.cell_at(x: cell.x, y: cell.y - 1)
    end
  end

  class BinaryHeading < Heading
    def initialize(grid, left, right)
      @left, @right = left, right
      super(grid)
    end

    def next_cell(cell)
      left_cell = @left.next_cell(cell)
      return nil if left_cell.nil?
      @right.next_cell(left_cell)
    end
  end

  class Cell
    attr_reader :x, :y, :value

    def initialize(grid: , x:, y:, value:)
      @grid, @x, @y, @value = grid, x, y, value
      @north, @east, @south, @west = North.new(grid), East.new(grid), South.new(grid), West.new(grid)
    end

    def max_product(digits)
      headings.map { |x| x.max_product(digits, self) }.max
    end

    private

    def headings
      @headings ||= [
        @north, BinaryHeading.new(@grid, @north, @east), 
        @east, BinaryHeading.new(@grid, @south, @east), 
        @south, BinaryHeading.new(@grid, @south, @west), 
        @west, BinaryHeading.new(@grid, @north, @west), 
      ]
    end
  end

  class Grid
    attr_reader :cells

    def initialize(cells = [])
      @cells = cells
    end

    def add_cell(x:, y:, value:)
      cells.push(Cell.new(grid: self, x: x, y: y, value: value))
    end

    def row_count
      cells.map { |x| x.x }.uniq!.count
    end

    def [](row)
      cells.find_all { |cell| cell.x == row }
    end

    def max_product(digits)
      cells.map { |cell| cell.max_product(digits) }.max
    end

    def cell_at(x:, y:)
      cells.find { |cell| cell.x == x && cell.y == y }
    end

    def self.build_from(items)
      grid = Grid.new
      items.each_with_index do |row, row_index|
        row.each_with_index do |cell, cell_index|
          grid.add_cell(x: row_index, y: cell_index, value: cell)
        end
      end
      grid
    end
  end

  class GreatestProduct
    attr_reader :grid

    def initialize(raw_grid)
      @raw_grid = raw_grid
      @grid = build_grid_from(raw_grid)
    end

    def greatest_product(digits:)
      grid.max_product(digits)
    end

    private

    def build_grid_from(raw_grid)
      items = [].tap do |grid|
        StringIO.new(raw_grid).each_line do |line|
          grid.push(line.split.map(&:to_i))
        end
      end
      Grid.build_from(items)
    end
  end

  subject { GreatestProduct.new(raw_grid) }

  let(:raw_grid) do
    <<-GRID
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
    GRID
  end

  it "returns the greatest product" do
    expect(subject.greatest_product(digits: 3)).to eql([])
  end

  it 'builds a grid from the raw grid' do
    raw_grid = <<-GRID
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
    GRID
    subject = GreatestProduct.new(raw_grid)
    expect(subject.grid.row_count).to eql(2)
    expect(subject.grid[0].map { |x| x.value }).to eql([8, 02, 22, 97, 38, 15, 0, 40, 0, 75, 04, 05, 07, 78, 52, 12, 50, 77, 91, 8])
    expect(subject.grid[1].map { |x| x.value }).to eql([49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 04, 56, 62, 00])
  end
end
