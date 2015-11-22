source 'https://rubygems.org'

gem "mina"
if ENV['LOCAL'] == "1"
  gem "mina-unicorn", path: "../mina-unicorn"
else
  gem "mina-unicorn"
end

gem "rack"
gem "unicorn"
