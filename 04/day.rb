# frozen_string_literal: true

$grid = []

File.foreach('input').each do |line|
  $grid << line.strip.split('')
end

xmas_count = 0

def check_wrapped(x, y, letter)
  wrapped_y = y % $grid.count
  wrapped_x = x % $grid[wrapped_y].count
  return false if x >= $grid[wrapped_y].count || x < 0
  return false if y >= $grid.count || y < 0

  $grid[wrapped_y][wrapped_x] == letter
end

def check_up(x, y)
  check_wrapped(x, y - 1, 'M') && check_wrapped(x, y - 2, 'A') && check_wrapped(x, y - 3, 'S')
end

def check_down(x, y)
  check_wrapped(x, y + 1, 'M') && check_wrapped(x, y + 2, 'A') && check_wrapped(x, y + 3, 'S')
end

def check_down_right(x, y)
  check_wrapped(x + 1, y + 1, 'M') && check_wrapped(x + 2, y + 2, 'A') && check_wrapped(x + 3, y + 3, 'S')
end

def check_down_left(x, y)
  check_wrapped(x - 1, y + 1, 'M') && check_wrapped(x - 2, y + 2, 'A') && check_wrapped(x - 3, y + 3, 'S')
end

def check_left(x, y)
  check_wrapped(x - 1, y, 'M') && check_wrapped(x - 2, y, 'A') && check_wrapped(x - 3, y, 'S')
end

def check_up_left(x, y)
  check_wrapped(x - 1, y - 1, 'M') && check_wrapped(x - 2, y - 2, 'A') && check_wrapped(x - 3, y - 3, 'S')
end

def check_right(x, y)
  check_wrapped(x + 1, y, 'M') && check_wrapped(x + 2, y, 'A') && check_wrapped(x + 3, y, 'S')
end

def check_up_right(x, y)
  check_wrapped(x + 1, y - 1, 'M') && check_wrapped(x + 2, y - 2, 'A') && check_wrapped(x + 3, y - 3, 'S')
end

def check_mas_x(x, y)
  total = 0
  total += 1 if check_wrapped(x - 1, y - 1, 'M') && check_wrapped(x + 1, y + 1, 'S')
  total += 1 if check_wrapped(x + 1, y + 1, 'M') && check_wrapped(x - 1, y - 1, 'S')
  total += 1 if check_wrapped(x + 1, y - 1, 'M') && check_wrapped(x - 1, y + 1, 'S')
  total += 1 if check_wrapped(x - 1, y + 1, 'M') && check_wrapped(x + 1, y - 1, 'S')
  # puts "#{x}/#{y} = #{total}"
  total == 2
end

mas_x_count = 0

$grid.count.times do |y|
  $grid[y].count.times do |x|
    if $grid[y][x] == 'X'
      xmas_count += 1 if check_up(x, y)
      xmas_count += 1 if check_up_left(x, y)
      xmas_count += 1 if check_up_right(x, y)
      xmas_count += 1 if check_down(x, y)
      xmas_count += 1 if check_down_left(x, y)
      xmas_count += 1 if check_down_right(x, y)
      xmas_count += 1 if check_left(x, y)
      xmas_count += 1 if check_right(x, y)
    elsif $grid[y][x] == 'A'
      mas_x_count += 1 if check_mas_x(x, y)
    end
  end
end

puts xmas_count
puts mas_x_count
