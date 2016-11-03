require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'

require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/request'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
