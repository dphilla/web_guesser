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
  message = ""
  if guess.to_i > SECRET_NUMBER
    message = "Too high!"
  elsif  guess != nil && guess.to_i < SECRET_NUMBER
    message = "Too low!"
  elsif guess.to_i == SECRET_NUMBER
    message =  "Correct! The secret number was #{SECRET_NUMBER}"
  end
  message
end

def way_to_high_or_low(guess)
  message = "Wayy to high!" if (guess.to_i + 5) > SECRET_NUMBER
  message = "Wayy to low!"  if (guess.to_i - 5) <  SECRET_NUMBER
  message
end
