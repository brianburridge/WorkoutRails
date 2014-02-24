root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require 'logger'

base = File.realpath(File.join(File.dirname(__FILE__) , '/..'))
preload_app true if ENV['UNICORN_PRELOAD']
worker_processes ENV['UNICORN_WORKERS'] ? ENV['UNICORN_WORKERS'].to_i : 1
timeout ENV['UNICORN_TIMEOUT'] ? ENV['UNICORN_TIMEOUT'].to_i : 120

if ENV['GH_APP']
  %w[tmp log tmp/pids tmp/sockets].each { |d| f = File.join(base, d) ; Dir.mkdir(f) unless File.exists?(f) }
  listen File.join(base,'tmp/sockets/unicorn.sock'), :backlog => 1024
  stderr_path File.join(base, 'log/unicorn.stderr.log')
  pid File.join(base, 'tmp/pids/unicorn.pid')
else
  listen ENV['GH_SOCKET_DIR'] + '/workout'
end

##
# Log Tailer
if ENV['RAILS_ENV'] == 'development'
  # make sure the development.log exists
  File.open("#{root}/log/development.log", 'ab') { }

  # fork off a tail process on development.log. unicorn will reap this on clean
  # shutdown but not when there's a boot error so kill it on process exit.
  tailer = fork { exec "tail", "-n", "0", "-f", "#{root}/log/development.log" }
  at_exit do
    if $0 !~ /worker\[\d+\]/
      begin
        Process.kill('KILL', tailer)
        Process.wait(tailer)
      rescue => boom
      end
    end
  end

  # write stuff to console immediately
  $stderr.sync = true
  $stdout.sync = true
end

before_fork do |server, worker|
  ##
  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.

  if ENV['GH_APP']
    old_pid = File.join(base,'tmp/pids/unicorn.pid.oldbin')
    if File.exists?(old_pid) && server.pid != old_pid
      begin
        Process.kill('QUIT', File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
        # someone else did our job for us
      end
    end
  end
end

# Called in the worker immediately after forking.
after_fork do |server, worker|
  ##
  # Unicorn master loads the app then forks off workers - because of the way
  # Unix forking works, we need to make sure we aren't using any of the parent's
  # sockets, e.g. db connection
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)

  # Redis and Memcached would go here but their connections are established
  # on demand, so the master never opens a socket

  if ENV['GH_APP']
    if log = Rails.logger.instance_values['log']
      ext = File.extname log.path
      new_path = log.path.gsub %r{(.*)(#{Regexp.escape ext})}, "\\1.#{worker.nr}\\2"
      Rails.logger.instance_eval do
        @log.close
        @log= open_log new_path, 'a+'
      end
    end
  end
end
