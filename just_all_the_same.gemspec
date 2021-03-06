
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "just_all_the_same/version"

Gem::Specification.new do |spec|
  spec.name          = "just_all_the_same"
  spec.version       = JustAllTheSame::VERSION
  spec.authors       = ["uproad krowd"]
  spec.email         = ["7349115+uproad@users.noreply.github.com"]

  spec.summary       = "You get Array#all?([An Immediate Value]) quickly."
  spec.description   = "Add class Array's instance methods => [all_nil?, all_true?, all_false?, all_same?(Immidiate Value)]"
  spec.homepage      = "https://github.com/uproad/just_all_the_same"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/uproad/just_all_the_same"
    spec.metadata["changelog_uri"] = "https://github.com/uproad/just_all_the_same"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/just_all_the_same/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 3.0"
end
