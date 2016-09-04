worker_processes 1
listen "localhost:3000"

shared_dir = File.expand_path('../../../shared/', __FILE__)
pid "#{shared_dir}/tmp/pids/unicorn.pid"

