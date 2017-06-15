require 'sinatra'
require 'sinatra/reloader'


rand_num = rand(101)    #placing outside of scope of getter method mean only
                        # hitting the first call of rand on each refresh

get '/' do
  "The secret number is #{rand_num}"
end
