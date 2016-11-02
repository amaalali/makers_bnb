ENV["RACK_ENV"] ||= "development"

# Gem related here:
require 'sinatra/base'

# App related here:
require_relative 'data_mapper_setup'
require_relative 'server'

# Controllers go here:
require_relative 'controllers/users'
<<<<<<< HEAD
require_relative 'controllers/sessions'
=======
require_relative 'controllers/spaces'
>>>>>>> 9b953b20ebe2948f7bedf36b6a601f5b28cd2d8d
