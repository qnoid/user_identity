source 'http://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.11'
gem 'thin', '~> 1.5.0'
gem 'rake', '0.9.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'paperclip', '~> 3.0', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'aws-sdk', '~> 1.3.4'
gem 'serialize_with_options'
gem 'authlogic', '~> 3.2.0'
gem 'pg', '~> 0.14.1'
gem 'bcrypt-ruby', '~> 3.0.1'

group :production, :staging do
  gem 'newrelic_rpm'
end

group :development do
  gem 'annotate', '2.4.0'
	gem 'debugger'
  gem 'taps', '~> 0.3.24'
end

group :test do
  gem 'rspec-rails', '2.12.0'
  gem 'spork', '~> 1.0rc'
	gem 'debugger'
  gem 'webrat', '0.7.1'
  gem 'factory_girl', '~> 4.1.0'
  gem 'factory_girl_rails', '~> 4.1.0', :require => false
end

group :development, :test do
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
