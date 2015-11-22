require "rack"

run Proc.new { |env| 
  [
    '200', 
    {'Content-Type' => 'text/html'}, 
    [
      "get racked: ",
      ENV['RACK_ENV'].to_s,
      ENV['RAILS_ENV'].to_s,
      Dir.pwd.to_s,
      ENV.inspect
    ]
  ] 
}
