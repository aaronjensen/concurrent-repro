require_relative "./config/boot"
require "sprockets"

environment = Sprockets::Environment.new(Dir.pwd)
environment.append_path("./app/assets/stylesheets")

manifest = Sprockets::Manifest.new(environment, "./app/assets/config/manifest.js")
manifest.find_sources("application.css").first

puts "It worked"
