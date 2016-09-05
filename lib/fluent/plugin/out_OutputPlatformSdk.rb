require "fluent/plugin/platformsdk/version"
require "fluent/output"

module Fluent
  # Your code goes here...

  class OutputPlatformSdk < Fluent::Output

    Fluent::Plugin::register_output('OutputPlatformSdk', self)
    def initialize
      super
    end

    def start
      super
    end

    # @param [Object] tag
    # @param [Object] es
    # @param [Object] chain
    def emit(tag, es, chain)
      chain.next
      es.each do |time, record|
        puts "OutputPlatformSdk: #{time} - #{record}"
      end
    end


    def shutdown
      super
    end

  end
end
