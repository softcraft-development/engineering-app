require "sinatra/base"

class EngineeringApp < Sinatra::Base
  set :sessions, true

  get "/" do
    "Hello, World!"
  end
end