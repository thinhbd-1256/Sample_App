source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass", "~> 3.3.7"
gem "bcrypt", "~> 3.1.11"
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.6"
gem "rails-i18n", "~> 5.0.0"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "sqlite3"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
  gem "minitest-reporters", "1.1.14"
  gem "rails-controller-testing", "1.0.2"
end

group :production do
  gem "pg", ">= 0.18.4"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
