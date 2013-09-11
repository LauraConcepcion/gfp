source 'https://rubygems.org'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'rails', '3.2.11'
gem 'cancan'
gem 'cocoon'
gem 'therubyracer'
gem 'inherited_resources'
gem 'jquery-rails'
gem 'select2-rails'
gem 'jquery-ui-rails'
gem 'rails_admin'
gem "rails_admin_import", :git => "https://github.com/RaVbaker/rails_admin_import.git"
gem "ransack" 
gem 'haml-rails'
gem 'simple_form'
gem 'show_for'
gem "devise"
gem "kaminari"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development, :test do
  gem 'debugger'
  gem "rspec-rails", "~> 2.0"
  gem "railroady"
  gem "faker", :git => "https://github.com/stympy/faker.git"
  gem 'factory_girl_rails'
  gem 'pg', '=0.13.2'
end

group :test do
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end  

group :production do
  gem 'mysql2'
  gem "faker", :git => "https://github.com/stympy/faker.git"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  gem 'uglifier', '>= 1.0.3'
end

