require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'pg'
require 'bcrypt'
require 'httparty'
require 'digest'

enable :sessions

# Databse
require_relative './db/db'

# Models
require_relative './models/card'
require_relative './models/character'
require_relative './models/user'

# Helper functions
require_relative './helpers/cards_helper'
require_relative './helpers/sessions_helper'

# Controllers
require_relative './controllers/cards_controller'
require_relative './controllers/characters_controller'
require_relative './controllers/sessions_controller'
require_relative './controllers/users_controller'

get '/' do
  erb :index
end










