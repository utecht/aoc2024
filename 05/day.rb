# frozen_string_literal: true

rules = []
updates = []

still_rules = true
File.foreach('input') do |line|
  if line.strip.empty?
    still_rules = false
  elsif still_rules
    rules << line.strip.split('|').map(&:to_i)
  else
    updates << line.strip.split(',').map(&:to_i)
  end
end

def check_rule(first_page, second_page, update)
  first_page_index = update.index(first_page)
  second_page_index = update.index(second_page)

  return first_page_index < second_page_index if !first_page_index.nil? && !second_page_index.nil?

  true
end

def fix_update(first_page, second_page, update)
  first_page_index = update.index(first_page)
  second_page_index = update.index(second_page)
  swap = update[first_page_index]
  update[first_page_index] = update[second_page_index]
  update[second_page_index] = swap
  update
end

def middle_page(update)
  update[(update.count / 2).to_i]
end

def all_rules_valid(rules, update)
  valid = true
  rules.each do |first_page, second_page|
    valid = false unless check_rule(first_page, second_page, update)
  end
  valid
end

middle_page_total = 0
bad_updates = []

updates.each do |update|
  valid = true
  rules.each do |first_page, second_page|
    valid = false unless check_rule(first_page, second_page, update)
  end
  if valid
    middle_page_total += middle_page(update)
  else
    bad_updates << update
  end
end

puts "MPT: #{middle_page_total}"

middle_page_total = 0
bad_updates.each do |update|
  until all_rules_valid(rules, update)
    rules.each do |first_page, second_page|
      update = fix_update(first_page, second_page, update) unless check_rule(first_page, second_page, update)
    end
  end
  middle_page_total += middle_page(update)
end
puts "Bad Updates MPT: #{middle_page_total}"
