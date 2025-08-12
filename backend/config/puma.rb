# Puma configuration file for Elastic Beanstalk
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Workers
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Port - this is important for EB
port ENV.fetch("PORT") { 3000 }

# Environment
environment ENV.fetch("RAILS_ENV") { "development" }

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Specify the PID file
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Only bind to socket in production if PORT is not set
if ENV.fetch("RAILS_ENV") { "development" } == "production" && !ENV["PORT"]
  bind "unix:///var/run/puma/my_app.sock"
  
  before_fork do
    require 'fileutils'
    FileUtils.mkdir_p("/var/run/puma")
    FileUtils.chmod(0755, "/var/run/puma")
  end
  
  daemonize true
  pidfile "/var/app/current/tmp/pids/puma.pid"
  state_path "/var/app/current/tmp/pids/puma.state"
  stdout_redirect "/var/app/current/log/puma.stdout.log", "/var/app/current/log/puma.stderr.log", true
end

# Development SSL settings (only if certs exist)
if ENV.fetch("RAILS_ENV") { "development" } == "development" 
  if File.exist?('config/certs/server.key') && File.exist?('config/certs/server.crt')
    ssl_bind '0.0.0.0', '3001', {
      key: 'config/certs/server.key',
      cert: 'config/certs/server.crt',
      verify_mode: 'none'
    }
  end
end

# Preload the application
preload_app!