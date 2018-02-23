module CronInfo
  class DayOfWeekParser < Parser
    def day_of_week_mappings
      {
        "mon" => 1,
        "tue" => 2,
        "wed" => 3,
        "thu" => 4,
        "fri" => 5,
        "sat" => 6,
        "sun" => 7
      }
    end

    def parse_word_range(cron_string)
      first_word, last_word = cron_string.split("-")
      if day_of_week_mappings[first_word.downcase] == nil || day_of_week_mappings[last_word.downcase] == nil
        raise "Invalid day of week word range argument #{cron_string}"
      end
      (day_of_week_mappings[first_word.downcase]..day_of_week_mappings[last_word.downcase]).to_a
    end

    def parse_word(cron_string)
      if day_of_week_mappings[cron_string.downcase] == nil
        raise "Invalid day of week argument #{cron_string}"
      end
      [day_of_week_mappings[cron_string.downcase]]
    end

    def min_value
      1
    end

    def max_value
      7
    end

    def label
      "day of week"
    end
  end
end
