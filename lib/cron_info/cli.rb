module CronInfo
  class Cli
    def run
      raise "Invalid number of arguments" unless ARGV.size > 5

      cron_strings = ARGV.slice(0, 5)
      command_string = ARGV.slice(5, (ARGV.size - 5)).join(" ")

      parser_result = CommandParser.new.parse(*cron_strings)
      parser_result.first(5).each do |(label, parsed_result)|
        puts '%-14.14s' % label + parsed_result.join(" ")
      end
      puts '%-14.14s' % 'command' + command_string
    end
  end
end
