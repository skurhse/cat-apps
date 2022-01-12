# frozen_string_literal: true
# typed: true

class Action
  extend T::Sig
  attr_reader :headers, :body, :request

  sig { params(block: T.untyped).void }
  def initialize(&block)
    @block = block
    @status = 200
    @headers = { 'Content-Type' => 'text/html' }
    @body = ''
  end

  def status(value = nil)
    value ? @status = value : @status
  end

  def params
    request.params
  end

  sig { params(env: T.untyped).returns(T::Array[T.untyped]) }
  def call(env)
    @request = Rack::Request.new(env)
    @body = instance_eval(&@block)
    [status, headers, [body]]
  end
end
