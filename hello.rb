module Tutorial
  class Hello < Grape::API
    namespace :hello, desc: 'Nothing really useful' do
      desc 'Get hello world' do
        detail '- This endpoint has no real usage. '\
               'It only shows what can be done with Grape and Swagger.'
      end
      get '' do
        {
          message: 'Hello world'
        }
      end

      desc 'Add two numbers' do
        detail '- Returns 422 if Ruby cannot parse arguments to Integer.'
        failure [[422, 'Unprocessable Entity', nil]]
      end
      params do
        requires :a, type: Integer, documentation: { example: 7, description: 'First number' }
        requires :b, type: Integer, documentation: { example: 42, description: 'Second number' }
      end
      get :add do
        a = Integer(params[:a]) rescue error!('422 Invalid first number', 422)
        b = Integer(params[:b]) rescue error!('422 Invalid second number', 422)
        {
          sum: a + b
        }
      end
    end
  end
end
