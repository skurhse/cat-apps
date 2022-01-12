# frozen_string_literal: true

# typed: false
require_relative 'actions'
class CatRack
  def self.app
    @app ||= Rack::Builder.new do
      map '/' do
        run ->(_env) { [404, { 'Content-Type' => 'text/plain' }, ['Page Not Found!']] }
      end
    end
  end
end

def route(pattern, &block)
  CatRack.app.map(pattern) do
    run Action.new(&block)
  end
end
