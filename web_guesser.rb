require 'sinatra'
require 'sinatra/reloader'


#what about dealing with inheritance here?

SECRET_NUMBER = rand(101)    #placing outside of scope of getter method mean only
                        # hitting the first call of rand on each refresh

get '/' do
   guess = params['guess']
   message = check_guess(guess)
   erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

# add some kinda loop limiting what is displayed and when?

def check_guess(guess)
  message = "" if guess.nil?
  message = "Too high!" if guess.to_i > SECRET_NUMBER
  message = "Too low!" if guess.to_i < SECRET_NUMBER
  message =  "Correct! The secret number was #{SECRET_NUMBER}" if guess.to_i == SECRET_NUMBER
  message
end
