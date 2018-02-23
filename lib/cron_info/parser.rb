module CronInfo
  class Parser
    def parse(cron_string)
      cron_string.split(",").map do |s|
        parse_single(s)
      end.flatten.uniq.sort
    end

    def parse_single(cron_string)
      if is_numeric?(cron_string)
        if cron_string.to_i > max_value || cron_string.to_i < min_value
          raise_out_of_range_error(cron_string)
        end
        [cron_string.to_i]
      elsif is_range?(cron_string)
        result = parse_range(cron_string)
        if result.last > max_value || result.first < min_value
          raise_out_of_range_error(cron_string)
        end
        result
      elsif is_every_time_interval?(cron_string)
        parse_every_time_interval(cron_string, min_value, max_value)
      elsif cron_string == "*"
        (min_value..max_value).to_a
      elsif is_word_range?(cron_string)
        parse_word_range(cron_string)
      elsif is_word?(cron_string)
        parse_word(cron_string)
      end
    end

    def raise_out_of_range_error(cron_string)
      raise "Cron string \"#{cron_string}\" is out of the allowed range of 0-#{max_value}"
    end

    def min_value
      raise NotImplementedError, "Implement in subclass"
    end

    def max_value
      raise NotImplementedError, "Implement in subclass"
    end

    def parse_every_time_interval(cron_string, min, max)
      raise "Invalid cron string #{cron_string}" unless cron_string.split("/").size == 2

      numerator, denominator = cron_string.split("/")
      if !(is_numeric?(denominator))
        raise "Denominator of #{cron_string} is not valid"
      end

      denominator = denominator.to_i

      if is_range?(numerator)
        numerator = parse_range(numerator)
        min = numerator.first
        max = [numerator.last, max].min
      elsif is_numeric?(numerator)
        min = numerator.to_i
        max = numerator.to_i
      end

      return_array = []
      current_value = min
      while current_value <= max
        return_array << current_value
        current_value += denominator
      end
      return_array
    end

    def parse_range(cron_string)
      first_number, last_number = cron_string.split("-").map(&:to_i)
      (first_number..last_number).to_a
    end

    def parse_word_range(cron_string)
      raise "Words are not supported for this type of cron entry"
    end

    def parse_word(cron_string)
      raise "Words are not supported for this type of cron entry"
    end

    def is_every_time_interval?(cron_string)
      !!(cron_string =~ /^.+\/\d+$/)
    end

    def is_range?(cron_string)
      !!(cron_string =~ /^\d+-\d+$/)
    end

    def is_numeric?(string)
      !!(string =~ /^\d+$/)
    end

    def is_word_range?(string)
      !!(string =~ /^[a-z|A-Z]+-[a-z|A-Z]+$/) && string.split("-").size == 2
    end

    def is_word?(string)
      !!(string =~ /^[a-z|A-Z]+$/)
    end
  end
end
