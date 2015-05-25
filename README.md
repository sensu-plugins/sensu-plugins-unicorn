## Sensu-Plugins-unicorn

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-unicorn.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-unicorn)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-unicorn.svg)](http://badge.fury.io/rb/sensu-plugins-unicorn)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-unicorn/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-unicorn)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-unicorn/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-unicorn)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-unicorn.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-unicorn)

## Functionality

## Files
 * bin/check-num-recordings.rb


## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-unicorn -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-unicorn`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-unicorn' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-unicorn' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
