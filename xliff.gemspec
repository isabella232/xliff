# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'xliff'
  spec.version = '0.1.0'
  spec.authors = ['Automattic']
  spec.email = ['mobile@automattic.com']

  spec.summary = 'Manage xliff files from Ruby'
  spec.description = 'Read and write xliff files'
  spec.homepage = 'https://github.com/automattic/xliff'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.4'

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/automattic/xliff/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = 'bin'
  spec.executables = ['console']
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'nokogiri', '~> 1.13'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
