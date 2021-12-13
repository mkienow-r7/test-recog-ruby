# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'recog/version'

Gem::Specification.new do |s|
  $stdout.puts "!!! File.expand_path(File.dirname(__FILE__)) = #{File.expand_path(File.dirname(__FILE__))}" # TODO: remove
  $stdout.puts "!!! __dir__ = #{__dir__}" # TODO: remove
  $stdout.puts "!!! File.expand_path(__dir__) = #{File.expand_path(__dir__)}" # TODO: remove

  s.name        = 'recog'
  s.version     = Recog::VERSION
  s.required_ruby_version = '>= 2.1'
  s.authors     = [
      'Rapid7 Research'
  ]
  s.email       = [
      'research@rapid7.com'
  ]
  s.homepage    = "https://www.github.com/rapid7/recog-ruby"
  s.summary     = %q{Network service fingerprint database, classes, and utilities}
  s.description = %q{
    Recog is a framework for identifying products, services, operating systems, and hardware by matching
    fingerprints against data returned from various network probes. Recog makes it simply to extract useful
    information from web server banners, snmp system description fields, and a whole lot more.
  }.gsub(/\s+/, ' ').strip

  s.bindir         = 'test-recog/bin'

  # s.files         = `git ls-files`.split("\n")
  s.files         = %w(Gemfile Rakefile COPYING LICENSE README.md recog.gemspec .yardopts) +
                    Dir.glob('lib/**/*.rb') +
                    Dir.glob('spec/**/*') +
                    Dir.glob('test-recog/xml/*') +
                    # Dir.glob('test-recog/bin/*') +
                    Dir.glob('test-recog/bin/recog_match')

  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # s.executables   = Dir['test-recog/bin/*'].map{ |f| File.basename(f) }
  # # s.executables   = Dir.glob("test-recog/bin/*").map{ |f| File.basename(f) }
  s.executables    = s.files.grep(%r{^test-recog/bin/}).map{ |f| File.basename(f) }

  s.require_paths = ['lib']
  $stdout.puts "s.files = #{s.files.join("\n")}" # TODO: remove
  $stdout.puts "s.test_files = #{s.test_files.join("\n")}" # TODO: remove
  $stdout.puts "s.executables = #{s.executables.join("\n")}" # TODO: remove
  $stdout.puts "s.require_paths = #{s.require_paths.join("\n")}" # TODO: remove
  $stdout.puts "File.dirname(File.expand_path($0)) = #{File.dirname(File.expand_path($0))}"
  $stdout.puts "File.expand_path(File.dirname(__FILE__)) = #{File.expand_path(File.dirname(__FILE__))}"
  $stdout.puts "File.expand_path('../lib', __FILE__) = #{File.expand_path('../lib', __FILE__)}"
  #$stdout.puts "File.expand_path('./lib', __FILE__) = #{File.expand_path('./lib', __FILE__)}" # BAD: .../recog.gemspec/lib
  #$stdout.puts "Gem.dir = #{Gem.dir}" # TODO: remove
  #$stdout.puts "Gem.datadir = #{Gem.datadir}" # TODO: remove
  $stdout.puts "File.expand_path('../test-recog/xml', __FILE__) = #{File.expand_path('../test-recog/xml', __FILE__)}"
  $stdout.puts "////////////////////////////////////////////////////////"

  # ---- Dependencies ----

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'yard'
  if RUBY_PLATFORM =~ /java/
    # markdown formatting for yard
    s.add_development_dependency 'kramdown'
  else
    # markdown formatting for yard
    s.add_development_dependency 'redcarpet'
  end
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'simplecov'

  s.add_runtime_dependency 'nokogiri'
end
