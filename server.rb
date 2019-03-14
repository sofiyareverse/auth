require 'sinatra'
require 'json'

class DecryptData
  attr_reader :data, :result

  def initialize(data)
    @data = data
    @result = {}
  end

  def call
    @result = {
      session: @data.each { |k, v| { k: v } }
    }
    @result
  end
end

get '/' do
  'Welcome to quickblox!'
end

post '/quickblox' do
  result = DecryptData.new(JSON.parse(request.body.read)['data']).call
  result.to_json
end
