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
	@username=params[:user_name]
	@phone=params[:phone]
	@datetime=params[:date]
	@barber=params[:barber]

	@client = Client.create(name: @username, phone: @phone, datestamp: @datetime, barber: @barber)
	@client.save

	return erb :index

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


