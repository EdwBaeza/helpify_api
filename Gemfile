source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'activerecord-postgres_enum', '~> 1.4'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'devise'
gem 'doorkeeper'
gem 'devise-jwt'
gem 'interactor', '~> 3.1', '>= 3.1.2'
gem 'jsonapi-serializer'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'reek'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'ulid'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'ffaker', '~> 1.9'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'rspec-rails'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.3'
  gem 'solargraph'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# gem 'nokogiri',platforms: [:mingw, :mswin, :x64_mingw, :jruby, :ruby]
