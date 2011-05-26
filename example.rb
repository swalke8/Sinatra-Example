require 'rubygems'
require 'sinatra'

enable :sessions

before do
  @messages = Hash["Hello", "Good-bye", "Good-bye", "Hello"]
end

get '/' do
  set_message if has_message?
  haml :index
end

helpers do
  def has_message?
    params[:message]
  end

  def set_message
    session[:message] = params[:message]
  end

  def valid_input?
    @messages.has_key?(session[:message])
  end

  def print_response
    @messages[session[:message]]
  end
end

