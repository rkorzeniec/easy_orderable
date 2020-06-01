# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require 'easy_orderable/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'easy_orderable'
  s.version     = EasyOrderable::VERSION
  s.authors     = ['Filip Pavic', 'Robert Korzeniec']
  s.email       = ['pavicfp@gmail.com', 'r.korzeniec@gmail.com']
  s.homepage    = 'https://github.com/sharoo/easy_orderable'
  s.summary     = 'Easy ordering of Active Record objects'
  s.description = 'Provide ordering interface for clients with minimal '\
                  'configuration in Active Record models'

  s.license     = 'MIT'

  s.require_paths = ['lib']
  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'activerecord', '>= 4.2'
  s.add_dependency 'activesupport', '>= 4.2'

  s.add_development_dependency 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  s.add_development_dependency 'rails', '>= 4.2'
  s.add_development_dependency 'rspec-rails', '~> 3.8', '>= 3.8.1'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  s.add_development_dependency 'rubocop', '~> 0.84'
  s.add_development_dependency 'rubocop-performance', '~> 1.6.0'
  s.add_development_dependency 'rubocop-rails', '~> 2.5.2'
  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.13'
end
