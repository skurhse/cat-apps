#!/usr/bin/env ruby

# tests the cat rack app

# frozen_string_literal: true
# typed: strong

module Test
  extend T::Sig

  ROOT_URL = T.let(URI('http://127.0.0.1:3000')

  URLs = T.let([
    URI('URI(hello?name=whiskers'),
    URI('http://127.0.0.1:3000/goodbye')
  ], T::Array[URI])


  sig { void }
  def self.main
    Net::HTTP.start(uri.host, uri.port) { |http|
      request = Net::HTTP::Get.new uri

  response = http.request request # Net::HTTPResponse object
end

Test::main
