require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

# Инициализируем базу данных
set :database, "sqlite3:barbershop.db"

# Создаем сущьность
class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end	


get '/' do
	@barbers = Barber.all
  erb :index
end


