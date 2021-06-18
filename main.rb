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
require_relative './models/listing'

# Helper functions
require_relative './helpers/api_helper'
require_relative './helpers/sessions_helper'
require_relative './helpers/collection_helper'
require_relative './helpers/listing_helper'

# Controllers
require_relative './controllers/cards_controller'
require_relative './controllers/characters_controller'
require_relative './controllers/sessions_controller'
require_relative './controllers/users_controller'
require_relative './controllers/listings_controller'

get '/' do
  redirect '/marketplace'
end










