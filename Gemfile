source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.7'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "interactor", "~> 3.0"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

