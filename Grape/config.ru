require 'rubygems'
require 'bundler'
Bundler.setup(:default)

require 'grape'

require './cat_app.rb'

Cat::App.compile!
run Cat::App
