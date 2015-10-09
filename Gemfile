source 'https://rubygems.org'
ruby '2.2.1'
####################

# CORE

####################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'


####################

# DB gems

####################
gem 'pg'

####################

# PLUGINS

####################
gem 'simple_form'

gem 'acts-as-taggable-on', '~> 3.4'

# assets precompilation + heroku magic
gem 'rails_12factor', group: :production

# user auth engine
gem 'devise'

# another plataformatec gem, amazing DRY tool
# https://github.com/plataformatec/responders
# used in devise source
gem 'responders'

# excellent -- quick but modular + testable for admin views, tables, queries + more. more flex than active admin it seems. see DEV_NOTES/speaker_deck_on_admin_abstraction.pdf
gem 'admino'

####################

# STYLES

####################

gem 'sass-rails', '~> 5.0'
gem 'foundation-rails'

####################

# JAVASCRIPT

####################
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'

gem 'browserify-rails'
gem 'react-rails', '~> 1.3.0'
# prefer no coffeescript
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


####################

# STAGING DUMMY DATA
# TODO add additional ENV to this app of staging

####################
gem 'faker'


# Use jquery as the JavaScript library
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

####################

# TESTING

####################


group :development, :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
end

