# frozen_string_literal: true

instructions = File.read('input')

total = 0
enabled = true
until instructions.empty?
  case instructions
  when /^mul\((\d+),(\d+)\)/
    a = $1.to_i
    b = $2.to_i
    total += a * b if enabled
  when /^do\(\)/
    enabled = true
  when /^don't\(\)/
    enabled = false
  end
  instructions.slice!(0)
end

puts total
