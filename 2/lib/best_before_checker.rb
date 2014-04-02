require 'date'

class BestBeforeChecker

  def earliest_date_for(possible_date)
    date_permutator = DatePermutator.new *parse_date(possible_date)
    valid_dates = date_permutator.valid_dates

    return %Q{#{possible_date} is illegal} if valid_dates.empty?

    earliest_date(valid_dates).to_s
  end



  private

  def earliest_date(valid_dates)
    valid_dates.sort.first
  end



  def parse_date(possible_date)
    possible_date.split("/").map &:to_i
  end

end


class DatePermutator

  def initialize(part1, part2, part3)
    @parts = [part1, part2, part3]
  end



  def valid_dates
    dates = []
    date_part_permutations.each do |date_parts|
      dates.push(Date.new(*date_parts)) if Date.valid_date? *date_parts
    end

    dates
  end



  private

  def date_part_permutations
    @parts.permutation.to_a
  end


end
