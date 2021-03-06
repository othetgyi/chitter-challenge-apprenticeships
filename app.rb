require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    #get the peeps data from the database
    #display the peeps int he view
    @peeps = Peeps.all
    erb :peeps
  end

  post '/add_peep' do
    Peeps.add_peep(message: params['message'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
