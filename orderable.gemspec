$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "orderable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sharoo_orderable"
  s.version     = Orderable::VERSION
  s.authors     = ["Filip Pavic"]
  s.email       = ["pavicfp@gmail.com"]
  s.homepage    = "https://github.com/sharoo/orderable"
  s.summary     = "Easy ordering of Active Record objects"
  s.description = "Provide ordering interface for clients with minimal configuration in Active Record models"

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0", ">= 5.0.0"

  s.add_development_dependency "sqlite3"
end
