require 'sinatra'
require_relative 'isbn_check.rb'


get '/' do 
    erb :index
end 

get '/index' do
    erb :index
end 

post '/index' do
my_isbn = params[:my_isbn].to_s
isbn_result = params[:isbn_result].to_s
isbn_result = check_last_number(my_isbn).to_s
redirect '/results?isbn_result=' + isbn_result.to_s + '&my_isbn=' + my_isbn.to_s
end 

get '/results' do 
my_isbn = params[:my_isbn].to_s
isbn_result = params[:isbn_result].to_s
erb :results, :locals => {:my_isbn => my_isbn, :isbn_result => isbn_result}
end

post '/results' do
my_isbn = params[:my_isbn].to_s
isbn_result = params[:isbn_result].to_s
end