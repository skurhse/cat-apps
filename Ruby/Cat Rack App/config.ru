# frozen_string_literal: true
# typed: false

require 'sorbet-runtime'

require_relative 'lib/catrack'

route('/hello') do
  "Meow #{params['name'] || 'World'}!\n"
end

route('/goodbye') do
  status 500
  "HISSSSSSSS\n"
end

run CatRack.app
