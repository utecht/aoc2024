left = []
right = []
File.foreach('test') do |line|
  a, b = line.split
  left << a.to_i
  right << b.to_i
end

left.sort!
right.sort!

distance = 0
left.zip(right).each do |l, r|
  distance += (r - l).abs
end

puts distance

similarity = 0
left.each do |l|
  similarity += l * right.count(l)
end

puts similarity
