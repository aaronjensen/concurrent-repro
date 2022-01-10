ENV["BUNDLE_GEMFILE"] ||= File.expand_path("./Gemfile", __dir__)
require "bundler/setup"
require "sprockets"

environment = Sprockets::Environment.new(Dir.pwd)
environment.append_path(".")

manifest = Sprockets::Manifest.new(environment, "./manifest.js")
manifest.find_sources("application.css").first

puts "It worked"
