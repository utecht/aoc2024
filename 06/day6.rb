# frozen_string_literal: true

grid = []

File.foreach('input') do |line|
  grid << line.strip.split('')
end

starting_x = nil
starting_y = nil
facing = :up

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    if cell == '^'
      starting_x = x
      starting_y = y
    end
  end
end

def advance(x, y, facing, grid)
  in_bounds = true
  new_x = x
  new_y = y
  new_facing = facing
  case facing
  when :up
    if y.zero?
      in_bounds = false
    elsif grid[y - 1][x] == '#'
      new_facing = :right
    else
      new_y = y - 1
    end
  when :right
    if x + 1 == grid[y].length
      in_bounds = false
    elsif grid[y][x + 1] == '#'
      new_facing = :down
    else
      new_x = x + 1
    end
  when :down
    if y + 1 == grid.length
      in_bounds = false
    elsif grid[y + 1][x] == '#'
      new_facing = :left
    else
      new_y = y + 1
    end
  when :left
    if x.zero?
      in_bounds = false
    elsif grid[y][x - 1] == '#'
      new_facing = :up
    else
      new_x = x - 1
    end
  end
  [new_x, new_y, new_facing, in_bounds]
end

in_bounds = true
spaces_touched = Set.new
current_x = starting_x
current_y = starting_y
while in_bounds
  spaces_touched.add("#{current_x},#{current_y}")
  current_x, current_y, facing, in_bounds = advance(current_x, current_y, facing, grid)
end

puts spaces_touched.count

loops_found = 0
grid.length.times do |y|
  grid[y].length.times do |x|
    new_grid = grid.map(&:clone)
    path = Set.new
    next if x == starting_x && y == starting_y

    new_grid[y][x] = '#'
    current_x = starting_x
    current_y = starting_y
    facing = :up
    not_looping = true
    in_bounds = true
    while in_bounds && not_looping
      not_looping = false if path.include?("#{current_x},#{current_y},#{facing}")
      path.add("#{current_x},#{current_y},#{facing}")
      current_x, current_y, facing, in_bounds = advance(current_x, current_y, facing, new_grid)
    end
    loops_found += 1 unless not_looping
  end
end

puts loops_found
