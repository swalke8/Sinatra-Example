require 'example'
require 'rack/test'

set :environment, :test

describe 'The Example App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "has a title 'Title that is displayed'" do
    get '/'
    last_response.should be_ok
    last_response.body.include?('Title that is displayed').should be_true
  end

  it "has asks for a message" do
    get '/'
    last_response.body.include?('Message:').should be_true
  end

  it "has a button" do
    get '/'
    last_response.body.include?('Button').should be_true
  end

  it "can respond" do
    get '/?message=Hello'
    last_response.body.include?('Good-bye').should be_true
  end
end

