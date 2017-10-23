require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# Инициализируем базу данных
set :database, "sqlite3:barbershop.db"

# Создаем сущьность


get '/' do
  erb :index
end


