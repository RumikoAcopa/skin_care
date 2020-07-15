require_relative 'lib/skin_care/version'
# lib = File.expand_path("lib", _dir_)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "skin_care"
  spec.version       = SkinCare::VERSION
  spec.authors       = ["rumikoacopa"]
  spec.email         = ["rumikorios@gmail.com"]

  spec.summary       = %q{Skin_Care CLI Gem}
  spec.description   = %q{Provides you a CLI you can run that allows you to search & get info on Skincare Businesses from the skin_care API. }
  spec.homepage      = "https://github.com/RumikoAcopa/skin_care"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # spec.bindir        = "exe"
  spec.executables   = ["skincare_cli"]
  spec.require_paths = ["lib"]

  # spec.add_dependency "httparty"
  spec.add_dependency "http"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
