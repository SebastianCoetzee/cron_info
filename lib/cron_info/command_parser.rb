module CronInfo
  class CommandParser
    def parse(*arguments)
      parsing_chain.zip(arguments).map do |parser, cron_string|
        [parser.label, parser.parse(cron_string)]
      end
    end

    def parsing_chain
      [
        MinuteParser.new,
        HourParser.new,
        DayOfMonthParser.new,
        MonthOfYearParser.new,
        DayOfWeekParser.new
      ]
    end
  end
end
