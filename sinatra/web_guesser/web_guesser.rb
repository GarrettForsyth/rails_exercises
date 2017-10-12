require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess) if not guess.nil?
  erb :index, :locals => { number: SECRET_NUMBER, message: message }

end

def check_guess(guess)
  message = ""
  correct = "Correct! The secret number was #{SECRET_NUMBER}."

  message = "Too high!" if guess.to_i > SECRET_NUMBER 
  message = "Too low!" if guess.to_i < SECRET_NUMBER
  message = correct if guess.to_i == SECRET_NUMBER
  message = "Way " + message if (SECRET_NUMBER - guess.to_i).abs > 5

  message
end

