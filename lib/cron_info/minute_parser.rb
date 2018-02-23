module CronInfo
  class MinuteParser < Parser
    def min_value
      0
    end

    def max_value
      59
    end

    def label
      "minute"
    end
  end
end
