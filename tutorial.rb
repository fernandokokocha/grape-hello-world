require 'grape'
require 'grape-swagger'

module Tutorial
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    desc 'Get hello world'
    get :hello do
      {
        message: 'Hello world'
      }
    end

    add_swagger_documentation
  end
end
