source "https://rubygems.org"

gem "mina"

if ENV["DEV"] == "1"
  gem "mina-unicorn", path: "../../"
else
  gem "mina-unicorn"
end

gem "rack"
gem "unicorn"
