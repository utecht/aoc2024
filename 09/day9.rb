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

def get_last_file_index(memory, starting_index)
  i = starting_index
  file_size = 0
  while i > 0
    i -= 1 until memory[i] != '.'
    cur_file = memory[i]
    until memory[i] != cur_file
      i -= 1
      file_size += 1
    end
    i += 1
    return [i, file_size]
  end
  [nil, nil]
end

def get_first_blank_of_size(memory, size)
  i = 0
  while i < memory.count
    file_size = 0
    i += 1 until memory[i] == '.'
    until memory[i] != '.'
      i += 1
      file_size += 1
    end
    return i - file_size if file_size >= size
  end
  nil
end

def blank_size(memory, empty_start)
  i = empty_start
  i += 1 until memory[i] != '.' || i > memory.count
  i - empty_start
end

def checksum(memory)
  total = 0
  memory.each_with_index do |value, index|
    total += index * value unless value == '.'
  end
  total
end

def memory_swap(memory, from_pos, to_pos, size)
  size -= 1
  swap = memory[to_pos..to_pos + size]
  memory[to_pos..to_pos + size] = memory[from_pos..from_pos + size]
  memory[from_pos..from_pos + size] = swap
  memory
end

starting_index = memory.count - 1
while starting_index > 0
  puts "Starting index: #{starting_index}"

  block_start, block_size = get_last_file_index(memory, starting_index)
  blank_start = get_first_blank_of_size(memory, block_size)

  starting_index = block_start
  starting_index -= 1

  unless blank_start.nil? || blank_start > block_start
    memory = memory_swap(memory, blank_start, block_start,
                         block_size)
  end
end

puts checksum(memory)
