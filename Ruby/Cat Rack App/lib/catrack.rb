require_relative 'actions'
class CatRack

  def self.app
    @app ||= begin
      Rack::Builder.new do
        map "/" do
          run ->(env) {[404, {'Content-Type' => 'text/plain'}, ['Page Not Found!']] }
        end
      end
    end
  end

end

def route(pattern, &block)
  CatRack.app.map(pattern) do
    run Action.new(&block)
  end
end
