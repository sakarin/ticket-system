source 'https://rubygems.org'
gem 'rails'
gem 'sqlite3', :group => [:development, :test]
gem 'pg', :group => :production
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  #gem 'bootstrap-google-sass', '>=0.0.4'
end
gem 'jquery-rails'
gem "unicorn", ">= 4.3.1", :group => :production
gem 'capistrano', :group => :production
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "capybara", ">= 2.0.2", :group => :test
gem "database_cleaner", ">= 0.9.1", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "less-rails", ">= 2.2.6", :group => :assets
gem "twitter-bootstrap-rails", ">= 2.2.4", :group => :assets
gem "libv8", ">= 3.11.8"
gem "therubyracer", ">= 0.11.3", :group => :assets, :platform => :ruby, :require => "v8"
gem "devise", ">= 2.2.3"
gem "devise_invitable", ">= 1.1.5"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"

gem "quiet_assets", ">= 1.0.1", :group => :development
gem "figaro", ">= 0.5.3"

gem "brakeman", :require => false

gem "carrierwave"
gem "mini_magick"
gem 'redactor-rails'

gem "simple_form", ">= 2.0.4"
gem 'client_side_validations'
gem 'client_side_validations-simple_form'


gem 'ransack', ">= 0.7.0"
gem "squeel", ">= 1.0.13"
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'wicked', ">=1.0.0"
gem 'state_machine'

gem 'pg'
gem "haml-rails"

gem 'bootstrap-datepicker-rails'


group :development do
  # See http://thechangelog.com/xray-rails-reveals-which-files-are-being-rendered-in-your-view/
  # bundle && rm -rf tmp/cache/assets
  #gem 'xray-rails'
  gem 'hirb'
  gem 'annotate'
  gem 'thin'

  gem "better_errors"
  gem "binding_of_caller"

end
