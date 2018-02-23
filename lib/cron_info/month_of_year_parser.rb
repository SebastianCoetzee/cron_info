module CronInfo
  class MonthOfYearParser < Parser
    def month_of_year_mappings
      {
        "jan" => 1,
        "feb" => 2,
        "mar" => 3,
        "apr" => 4,
        "may" => 5,
        "jun" => 6,
        "jul" => 7,
        "aug" => 8,
        "sep" => 9,
        "oct" => 10,
        "nov" => 11,
        "dec" => 12
      }
    end

    def parse_word_range(cron_string)
      first_word, last_word = cron_string.split("-")
      if month_of_year_mappings[first_word.downcase] == nil || month_of_year_mappings[last_word.downcase] == nil
        raise "Invalid month of year word range argument #{cron_string}"
      end
      (month_of_year_mappings[first_word.downcase]..month_of_year_mappings[last_word.downcase]).to_a
    end

    def parse_word(cron_string)
      if month_of_year_mappings[cron_string.downcase] == nil
        raise "Invalid month of year argument #{cron_string}"
      end
      [month_of_year_mappings[cron_string.downcase]]
    end

    def min_value
      1
    end

    def max_value
      12
    end

    def label
      "month"
    end
  end
end
