require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(101)

get '/' do
   guess = params['guess']
   message = check_guess(guess)
   erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  message = ""
  if guess != nil && guess.to_i - SECRET_NUMBER < -5
    message = "Wayy too low!"
  elsif guess.to_i - SECRET_NUMBER > 5
    message = "Wayy too high!"
  elsif guess.to_i > SECRET_NUMBER
    message = "Too high!"
  elsif  guess != nil && guess.to_i < SECRET_NUMBER
    message = "Too low!"
  elsif guess.to_i == SECRET_NUMBER
    message =  "Correct! The secret number was #{SECRET_NUMBER}"
  end
  message
end
