require 'sinatra'
require_relative 'isbn_check.rb'
enable :sessions

get '/' do 
    erb :index
end 

post '/index' do
session[:my_isbn] = params[:my_isbn].to_s
session[:isbn_result] = params[:isbn_done].to_s
session[:isbn_result] = isbn_checker(my_isbn).to_s
redirect '/results'
end 

get '/result' do 
session[:my_isbn] = params[:my_isbn]
session[:isbn_done] = params[:isbn_done]
end
