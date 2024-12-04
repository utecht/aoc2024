reports = []

File.readlines('input').each do |line|
  reports << line.split.map(&:to_i)
end

safe_reports = 0

reports.each do |report|
  (report.count + 1).times do |i|
    safe_report = report.dup
    safe_report.delete_at(i)
    all_increasing = true
    all_decreasing = true
    small_gap = true
    last = nil
    safe_report.each do |level|
      unless last.nil?
        if level > last
          all_decreasing = false
        elsif level < last
          all_increasing = false
        else
          all_increasing = false
          all_decreasing = false
        end

        if (level - last).abs > 3
          small_gap = false
        end
      end
      last = level
    end
    if (all_increasing || all_decreasing) && small_gap
      safe_reports += 1
      break
    end
  end
end

puts safe_reports

