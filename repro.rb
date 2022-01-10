ENV["BUNDLE_GEMFILE"] ||= File.expand_path("./Gemfile", __dir__)
require "bundler/setup"
require "concurrent-ruby"

def run
  return to_enum(__method__) unless block_given?

  executor = :fast
  # This works
  # executor = :immediate

  promises = [
    Concurrent::Promise.execute(executor: executor) do
      yield "some-value"
    end
  ]
  promises.each(&:wait!)

  nil
end

# This does not work
run.first

# This works
# run.to_a.first

puts "It worked"
