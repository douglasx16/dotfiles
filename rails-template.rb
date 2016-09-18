gem 'haml-rails'
gem 'hamlit'
gem 'bootstrap-sass'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'pry-rails'
gem 'pry-byebug'
gem 'puma'
gem 'redcarpet'
gem 'font-awesome-sass'

gem_group :development do
  gem 'better_errors'
  gem 'erb2haml'
  gem 'binding_of_caller'
  gem 'byebug', platform: :mri
end

gem_group :test do
  gem 'minitest-utils'
  gem 'database_cleaner'
end

gem_group :development, :test do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'letter_opener'
  gem 'dotenv-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem_group :production do
  gem 'pg'
  gem 'rails_12factor'
end

environment 'config.sass.preferred_syntax = :sass'

run 'rm README.md'

after_bundle do
  run 'rake haml:replace_erbs'
  file 'app/assets/stylesheets/scaffolds.sass', bootstrap
  git :init
  git add: '.'
  git commit: %Q{ -m 'Init.' }
end

def bootstrap
  <<-EOF
@import 'bootstrap-sprockets'
@import 'bootstrap'
@import 'font-awesome-sprockets'
@import 'font-awesome'
EOF
end
