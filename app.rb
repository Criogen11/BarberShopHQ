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
	validates :email_address, presence: true
	validates :message, presence: true
end	

before do
	@barber = Barber.all
end

get '/' do
  erb :index
end

get '/visit' do
	@c = Client.new
	erb :visit
end	

post '/visit' do
	
	@c = Client.new params[:client]
	if @c.save
		erb "Спасибо что записались!"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end		
end	

get '/contacts' do
  erb :contacts
end

post '/contacts' do
	
	@b = Contact.new params[:contact]
	if @b.save
		erb "Спасибо за ваше сообщение!"
	else 
		@error = @b.errors.full_messages.first
		erb :contacts
	end	

end	

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end	

get '/bookings' do
	@clients = Client.order('created_at DESC')
	erb :bookings
end	

get '/client/:id' do
	@client = Client.find(params[:id])
	erb :client
end	


