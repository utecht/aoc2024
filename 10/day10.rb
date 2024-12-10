# frozen_string_literal: true

grid = []

File.foreach('input') do |line|
  grid << line.strip.split('').map(&:to_i)
end

$tops_reached = Set.new

def score_trailhead(x, y, grid)
  value = grid[y][x]
  if value == 9
    # return 0 if $tops_reached.include?([x, y])

    $tops_reached.add([x, y])
    return 1

  end

  total = 0
  # check up
  total += score_trailhead(x, y - 1, grid) if y > 0 && grid[y - 1][x] == (value + 1)
  # check down
  total += score_trailhead(x, y + 1, grid) if y + 1 < grid.count && grid[y + 1][x] == (value + 1)
  # check left
  total += score_trailhead(x - 1, y, grid) if x > 0 && grid[y][x - 1] == (value + 1)
  # check right
  total += score_trailhead(x + 1, y, grid) if x + 1 < grid[y].count && grid[y][x + 1] == (value + 1)
  total
end

trailhead_scores = 0

grid.each_with_index do |row, y|
  row.each_with_index do |value, x|
    $tops_reached = Set.new
    puts "Trailhead at #{x}, #{y} has a score of #{score_trailhead(x, y, grid)}" if value == 0
    $tops_reached = Set.new
    trailhead_scores += score_trailhead(x, y, grid) if value == 0
  end
end

puts trailhead_scores
