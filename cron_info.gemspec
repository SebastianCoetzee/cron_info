require './lib/cron_info/version'

Gem::Specification.new do |spec|
  spec.name          = 'cron_info'
  spec.version       = CronInfo::VERSION
  spec.authors       = ['Sebastian Coetzee']
  spec.email         = ['mail@sebastiancoetzee.com']

  spec.summary       = 'This gem parses a cron string and prints a table of information about it'
  spec.description   = ''
  spec.homepage      = 'https://github.com/SebastianCoetzee/cron_info'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']
  spec.executables   = ['cron_info']
  spec.license = 'MIT'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '>= 10'
  spec.add_development_dependency 'rspec', '~> 3.7.0'
end
