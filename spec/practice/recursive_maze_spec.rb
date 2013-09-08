require "spec_helper"

def print_maze(maze)
  p " ||A||B||C||D||E||F||G||H||"
  8.times do |n|
    result = "#{n+1}|"
    maze.each do |column|
      result += "|#{column[n]}|"
    end
    p result + "|"
  end
end

describe "maze" do
  it "should be solvable" do
    maze = Array.new(8) { Array.new(8) { " " } }
    8.times { |n| maze[n][0] = "*" if (0...5).include?(n) } # row 1
    maze[0][1] = maze[4][1] = "*" # row 2
    maze[0][2] = maze[2][2] = maze[3][2] = maze[4][2] = "*" # row 3
    maze[0][3] = maze[4][3] = maze[5][3] = maze[6][3] = maze[7][3] = "*" # row 4
    maze[0][4] = maze[2][4] = maze[7][4] = "*" # row 5
    maze[0][5] = maze[4][5] = maze[7][5] = "*" # row 6
    maze[0][6] = maze[1][6] = maze[2][6] = maze[3][6] = maze[4][6] = maze[7][6] = "*" # row 7
    maze[4][7] = maze[5][7] = maze[6][7] = maze[7][7] = "*" # row 8

    maze[1][2] = "S"
    maze[6][6] = "E"
    print_maze(maze)

    #is_maze_solveable(maze).should be_true
  end
end
