# frozen_string_literal: true

disk_map = File.read('input').strip.split('').map(&:to_i)

memory = []

blank = false
file_iterator = 0
disk_map.each do |size|
  symbol = blank ? '.' : file_iterator
  size.times do |_i|
    memory << symbol
  end
  file_iterator += 1 unless blank
  blank = !blank
end

puts memory.join('')

def get_last_file_index(memory, last_known_index)
  last_known_index -= 1 until memory[last_known_index] != '.'
  last_known_index
end

def checksum(memory)
  total = 0
  memory.each_with_index do |value, index|
    total += index * value unless value == '.'
  end
  total
end

last_file_index = memory.count - 1
memory.count.times do |i|
  next unless memory[i] == '.'

  last_file_index = get_last_file_index(memory, last_file_index)
  next if last_file_index <= i

  swap = memory[last_file_index]
  memory[last_file_index] = memory[i]
  memory[i] = swap
  # puts memory.join('')
end

puts checksum(memory)
