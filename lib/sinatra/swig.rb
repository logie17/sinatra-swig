require 'sinatra/base'
require 'webservice/swigclient'

module Sinatra
  module Swig
    def render(template, options)
      params = {}
      params['api_key']       = settings.api_key if settings.respond_to?(:api_key)
      params['service_url']   = settings.service_url if settings.respond_to?(:service_url)
      params['error_handler'] = settings.error_handler if settings.respond_to?(:error_handler)
      client = WebServiceSwigClient.new(params)
      client.render(template, options)
    end
  end
  helpers Swig
end
