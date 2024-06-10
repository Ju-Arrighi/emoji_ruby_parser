# frozen_string_literal: true

require_relative "lib/emoji_ruby_parser/version"

Gem::Specification.new do |spec|
  spec.name = "emoji_ruby_parser"
  spec.version = EmojiRubyParser::VERSION
  spec.authors = ["Juliana Arrighi"]
  spec.email = ["jarrighi@poli.ufrj.br"]

  spec.summary = "A Ruby Gem to parse emojis into words."
  spec.description = "A Ruby Gem to parse emojis into words."
  spec.homepage = "https://github.com/Ju-Arrighi/emoji_ruby_parser"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "Set"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Ju-Arrighi/emoji_ruby_parser"
  spec.metadata["changelog_uri"] = "https://github.com/Ju-Arrighi/emoji_ruby_parser"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
