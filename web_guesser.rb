require 'sinatra'
require 'sinatra/reloader'


random_number = rand(101)    #placing outside of scope of getter method mean only
                        # hitting the first call of rand on each refresh

get '/' do
  erb :index, :locals => {:number => random_number}
end
