require 'spec_helper'
require 'sinatra'
require 'rack/test'
require 'sinatra/swig'
require 'webservice/swigclient'
require 'test/redef'


set :api_key, 'bar'
set :service_url, 'http://baz'
get "/" do 
  content_type "text/html"
  return render("./foo.html", { :foo => 'bar' })
end

describe "SinatraSwig" do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  it "does stuff" do 
    expect(1).to eq 1
  end

  it "should handle the root URL" do
    Test::Redef.rd(
      'WebServiceSwigClient.new'    => :wiretap,
      'WebServiceSwigClient#render' => proc { "yo yo yo" }
    ) do|rd|
      get "/", :url => "/"
      expect(rd[:new?].called)
      expect(rd[:new].args[0][0]).to eq ({"api_key"=>"bar", "service_url"=>"http://baz"})
      expect(rd[:render].args[0]).to eq (["./foo.html", {:foo=>"bar"}])
      expect(last_response).to be_ok
      expect(last_response.body).to eq "yo yo yo"
    end
  end
end
