source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'active_storage_validations', '0.9.8'
gem 'bcrypt', '3.1.18'
gem 'bootsnap', '1.12.0', require: false
gem 'bootstrap-sass', '3.4.1'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'faker', '2.21.0'
gem 'image_processing', '1.12.2'
gem 'importmap-rails', '1.1.0'
gem 'jbuilder', '2.11.5'
gem 'pg', '~> 1.1'
gem 'puma', '5.6.4'
gem 'rails', '~> 7.0.8'
gem 'rubocop', '>= 1.0', '< 2.0'
gem 'sassc-rails', '2.1.2'
gem 'sprockets-rails', '3.4.2'
gem 'stimulus-rails', '1.0.4'
gem 'turbo-rails', '1.1.1'
gem 'will_paginate', '3.3.1'
group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'web-console'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'aws-sdk-s3', '1.114.0', require: false
end
