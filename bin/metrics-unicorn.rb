#! /usr/bin/env ruby
#
#   unicorn-metrics
#
# DESCRIPTION:
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: raindrops
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Copyright 2014 Sonian, Inc. and contributors. <support@sensuapp.org>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require 'raindrops'

class UnicornMetrics < Sensu::Plugin::Metric::CLI::Graphite
  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-s SCHEME',
         long: '--scheme SCHEME',
         default: "#{Socket.gethostname}.unicorn"

  option :addr,
         description: 'tcp address and port (e.g. 127.0.0.1:8080)',
         short: '-a ADDRESS',
         long: '--address ADDRESS'

  option :socket,
         description: 'Unicorn socket path',
         short: '-p SOCKET',
         long: '--socket-path SOCKET',
         default: '/tmp/unicorn.sock'

  def run
    output "#{config[:scheme]}.active", stats.active
    output "#{config[:scheme]}.queued", stats.queued
    ok
  end

  private

  def stats
    @stats ||= begin
      if config[:addr]
        Raindrops::Linux.tcp_listener_stats([config[:addr]])[config[:addr]]
      elsif config[:socket]
        Raindrops::Linux.unix_listener_stats([config[:socket]])[config[:socket]]
      end
    end
  end
end
