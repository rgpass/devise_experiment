source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.6'
gem 'pg', '0.15.1'
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'devise'

group :doc do
  gem 'sdoc', require: false
end

group :development do
end

group :development, :test do
	gem 'rspec-rails', '2.13.1'
	gem 'pry'
end

group :test do
	gem 'factory_girl_rails', '4.2.0'
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
	gem 'cucumber-rails', '1.4.0', require: false
	gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

group :production	do
	gem 'rails_12factor', '0.0.2'
end
