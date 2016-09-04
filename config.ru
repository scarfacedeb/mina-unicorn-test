require "rack"

run Proc.new { |env| 
  [
    '200', 
    {'Content-Type' => 'text/html'}, 
    [
      "GET SCHWIFTY: ",
      ENV['RACK_ENV'].to_s,
      " OR ",
      ENV['RAILS_ENV'].to_s
    ]
  ] 
}
