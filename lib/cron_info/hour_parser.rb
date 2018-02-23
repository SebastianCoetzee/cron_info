module CronInfo
  class HourParser < Parser
    def min_value
      0
    end

    def max_value
      11
    end

    def label
      "hour"
    end
  end
end
