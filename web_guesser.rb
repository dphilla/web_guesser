require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(101)    #placing outside of scope of getter method mean only
                        # hitting the first call of rand on each refresh

get '/' do
   guess = params['guess']
   message = check_guess(guess)
   erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end



def check_guess(guess)
  if params['guess'].to_i > SECRET_NUMBER
      message = "Too high!"
  elsif params['guess'].to_i < SECRET_NUMBER
    message = "Too low!"
  else
    message =  "You guessed correctly!" + " The secret number was
    #{SECRET_NUMBER}"
  end
end
