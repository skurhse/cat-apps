# frozen_string_literal: true
# typed: false

require_relative 'lib/catrack'

route('/hello') do
  "Meow #{params['name'] || 'World'}!"
end

route('/goodbye') do
  status 500
  'HISSSSSSSS'
end

run CatRack.app
