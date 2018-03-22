source 'https://rubygems.org'
ruby '2.2.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'sprockets', '~> 3.7.0'

gem 'devise'

gem 'bootstrap-sass', '~> 3.3.6'

gem "font-awesome-rails"

gem "autoprefixer-rails"

# Opens email in browser during dev
gem "letter_opener", group: :development

# Get member info from MailChimp
gem 'mailchimp-api', require: 'mailchimp'

# Gibbon is the MailChimp API wrapper
gem 'gibbon', '~> 2.2.4'

# Paperclip for uploading images
gem 'paperclip', :git=> 'https://github.com/thoughtbot/paperclip', :ref => '523bd46c768226893f23889079a7aa9c73b57d68'
gem "aws-sdk"

gem 'simple_form'

gem 'mail_form'

# wysiwig editor
gem 'summernote-rails', '0.8.2'

gem 'bootstrap_form'

# for nested commenting
gem 'closure_tree'

# like button for comments
#gem 'acts_as_votable', '~> 0.10.0'

gem 'instagram'

gem 'social_shares'

# gem 'thredded', '~> 0.11.0'

# helps Thredded display user profile information
gem 'backport_new_renderer'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production, :staging do
  gem "pg" 
  gem 'rails_12factor'
end

group :development, :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


