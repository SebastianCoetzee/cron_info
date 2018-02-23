module CronInfo
  class DayOfMonthParser < Parser
    def min_value
      1
    end

    def max_value
      31
    end

    def label
      "day of month"
    end
  end
end
