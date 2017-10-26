require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

# Инициализируем базу данных
set :database, "sqlite3:barbershop.db"

# Создаем сущьность
class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
end

class Barber < ActiveRecord::Base

end	

class Contact <ActiveRecord::Base

end	

before do
	@barber = Barber.all
end

get '/' do
  erb :index
end

get '/visit' do
	erb :visit
end	

post '/visit' do
	
	c = Client.new params[:client]
	c.save

	erb "Спасибо что записались!"

end	

get '/contacts' do
  erb :contacts
end

post '/contacts' do
	@message=params['message']
	@email=params['email_address']

	@contacts = Contact.create(email_address: @email, message: @message)
	@contacts.save

	return erb :index
end	


