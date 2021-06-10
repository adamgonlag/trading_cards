require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'pg'

enable :sessions

get '/' do
  erb :index
end





