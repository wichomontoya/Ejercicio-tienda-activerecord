require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require './models/usuario.rb'
require './models/item.rb'

get '/' do
  redirect '/usuarios'
end

get '/usuarios' do
	@usuarios=Usuario.all
	erb :index
end

get '/usuarios/new' do
	erb :new
end

post '/usuarios' do
	Usuario.create({nombre: params[:nombre]})
	redirect '/usuarios'
end

get '/usuarios/:id' do
	@usuario=Usuario.find(params[:id])
	@items=@usuario.items
	erb :show
end

get '/usuarios/:id/edit' do
	@usuario=Usuario.find(params[:id])
	erb :edit
end

put '/usuarios/:id' do
	usuario=Usuario.find(params[:id])
	usuario.nombre=params[:nombre]
	usuario.save
	redirect '/usuarios'
end

delete '/usuarios/:id' do
	usuario=Usuario.find(params[:id])
	usuario.destroy
	redirect '/'
end

post '/usuarios/:id/create' do
	@usuario=Usuario.find(params[:id])
	@items=@usuario.items
	@items.create({nombre: params[:nombre], precio: params[:precio]})
	redirect '/usuarios'
end

delete '/usuarios/:id/borraritem' do
	item=Item.find(params[:id])
	item.destroy
	redirect '/usuarios/'+item.usuario_id.to_s
end