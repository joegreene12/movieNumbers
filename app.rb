require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "movienumbers"

)

get '/' do
  movstat = Movstat.create({:title => 'movie', :yearrelease => '1999', :productionbudget => '10000000', :worldwidegross => '200000000'}).to_json
end

get '/api/movstats' do
  Movstat.all.to_json
end

get '/api/movstats/:id' do
  puts params
  Movstat.find(params[:id]).to_json
end
