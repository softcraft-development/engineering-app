require "sinatra/base"

class EngineeringApp < Sinatra::Base
  set :sessions, true
  set :static, true

  get "/" do
    haml :index
  end
end