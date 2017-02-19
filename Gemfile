source 'https://rubygems.org'
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'annotate'
gem 'rails', '~> 5.0.1'
gem 'devise'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'haml-rails', '~> 0.9'
gem 'materialize-sass'
gem 'high_voltage', '~> 3.0.0'
gem 'omniauth-facebook'
gem 'material_icons'
gem 'simple_form'
gem 'materialize-form'
gem 'money-rails', '~>1'
gem 'activerecord-session_store'
gem 'chartkick'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'awesome_print', '1.6.1'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
