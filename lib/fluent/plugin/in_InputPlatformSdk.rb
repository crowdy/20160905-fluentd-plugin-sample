require "fluent/plugin/platformsdk/version"
require "fluent/input"

# @see http://docs.fluentd.org/articles/plugin-development
module Fluent
  # Your code goes here...

  class InputPlatformSdk < Fluent::Input

    Fluent::Plugin::register_input('InputPlatformSdk', self)
    def initialize
      super
      print("initializing ...")
    end

    def start
      super
      @runloop = 0
      @thread = Thread.new(&method(:run))
      @thread.join
    end

    def run
      loop do
        router.emit("debug.debug", Fluent::Engine.now, {"simple"=>"tkim_debu"})
        router.emit("PlatformSdk.output>", Fluent::Engine.now, {"simple"=>"tkim_debu"})
        sleep(1)
        @runloop = @runloop + 1
        if (@runloop >= 10)
            @thread.exit
        end
      end
    end

    def shutdown
      print("shutting down...")
      super
    end

  end
end
