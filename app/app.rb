ENV["RACK_ENV"] ||= "development"

# Gem related here:
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

# App related here:
require_relative 'helpers'
require_relative 'data_mapper_setup'
require_relative 'server'

# Controllers go here:
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/spaces'
require_relative 'controllers/requests'
