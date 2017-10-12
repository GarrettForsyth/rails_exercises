require 'sinatra'
require 'sinatra/reloader'

 secretNumber = rand(100)

get '/' do
  "The secret number is #{secretNumber}".upcase
end
