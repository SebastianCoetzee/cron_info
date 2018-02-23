# Cron Info

[![Build Status](https://travis-ci.org/SebastianCoetzee/cron_info.svg?branch=master)](https://travis-ci.org/SebastianCoetzee/cron_info)

A command-line tool that parses a cron string and expands each field to show the times at which it will run.

## Installation

There are two ways to install Cron Info, either straight from RubyGems or from the repository.

### Installing from RubyGems

```
gem install cron_info
```

### Installing from repository

Clone the repository:

```
git clone https://github.com/SebastianCoetzee/cron_info.git
```

Change into the directory:

```
cd cron_info
```

Build the gem:

```
gem build cron_info.gemspec
```

Install the gem (replace `x` with the version number of the gem):

```
gem install cron_info-x.x.x.gem
```

## Usage

Run the tool with the following command, which parses a cron string and expands each field to show the times at which it will run:

```
cron_info "*/15" 0 1,15 "*" 1-5 /usr/bin/find
```

Output:

```
minute        0 15 30 45
hour          0
day of month  1 15
month         1 2 3 4 5 6 7 8 9 10 11 12
day of week   1 2 3 4 5
command       /usr/bin/find
```

# Testing

After cloning the repository as explained above, from the root of the repository, run the following:

```
gem install bundler
```

Then install the dependencies:

```
bundle install
```

After the dependencies are installed, run the following command to run the test suite:

```
rspec
```

# License

MIT
