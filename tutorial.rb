require 'grape'
require 'grape-swagger'
require './hello.rb'

module Tutorial
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    mount Tutorial::Hello => '/'

    add_swagger_documentation
  end
end
