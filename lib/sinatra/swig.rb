require 'sinatra/base'
require 'webservice/swigclient'

client = WebServiceSwigClient.new(
  :api_key       => '123',
  :service_url   => 'http://localhost',
  :error_handler => Proc.new{|error|
    expect(error).to eq 'There was a problem communicating with the server'
  }
)
      
module Sinatra
  module Swig
    def render(template, options)
      client.render(template, options)
    end
  end
  helpers Swig
end
