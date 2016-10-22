source "https://rubygems.org"

gem "mina"

if ENV["FROM_RUBYGEMS"] == "1"
  gem "mina-unicorn"
else
  gem "mina-unicorn", path: "../../"
end

gem "rack"
gem "unicorn"

gem "pry"
