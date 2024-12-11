# frozen_string_literal: true

stones = File.read('input').strip.split(' ').map(&:to_i)

$stone_scores = {}

def score_stone(stone, count)
  return 1 if count == 75
  return $stone_scores[[stone, count]] if $stone_scores.key?([stone, count])

  if stone.zero?
    score = score_stone(1, count + 1)
    $stone_scores[[stone, count]] = score
    return score
  end

  num_digits = Math.log10(stone).to_i + 1
  unless num_digits.even?
    score = score_stone(2024 * stone, count + 1)
    $stone_scores[[stone, count]] = score
    return score
  end

  tens = 10**(num_digits / 2)
  first_half = (stone / tens).to_i
  second_half = stone - (first_half * tens)
  score = (score_stone(first_half, count + 1) + score_stone(second_half, count + 1))
  $stone_scores[[stone, count]] = score
  score
end

total = 0
stones.each do |stone|
  total += score_stone(stone, 0)
end

puts total
puts $stone_scores.size
