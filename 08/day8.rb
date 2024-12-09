# frozen_string_literal: true

grid = []
File.foreach('input') do |line|
  grid << line.strip.split('')
end

antennas = Hash.new { |h, k| h[k] = [] }

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    antennas[cell] << [x, y] if cell != '.'
  end
end

def find_antinode(a, b)
  ax, ay = a
  bx, by = b

  slope_x = bx - ax
  slope_y = by - ay

  [ax - slope_x, ay - slope_y]
end

def in_range(antinode, max_x, max_y)
  x, y = antinode

  return false if x.negative? || y.negative?
  return false if x >= max_x || y >= max_y

  true
end

antinodes = Set.new

max_x = grid.first.count
max_y = grid.count

antennas.each do |_frequency, coords|
  coords.permutation(2).each do |a, b|
    antinodes << a
    antinode = find_antinode(a, b)
    first = antinode
    last = a
    while in_range(antinode, max_x, max_y)
      antinodes << antinode
      antinode = find_antinode(first, last)
      last = first
      first = antinode
    end
  end
end

puts antinodes.count

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    if antinodes.include?([x, y]) && cell == '.'
      print '#'
    else
      print cell
    end
  end
  print "\n"
end
