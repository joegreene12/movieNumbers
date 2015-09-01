require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "movienumbers"

)


get '/movienumber' do
  erb:movienumber
end


## get
# get 'api/m'


get '/' do
  @key = ENV["API_KEY"]
  print @key
  erb :movienumber
end

## get()
def authorized?(requested)
  if !params[:api_key].nil? && params[:api_key] == ENV["API_KEY"]
    return requested.to_json
  else
    return {:status => '403', :message => 'not authorized'}.to_json
  end
end

get '/api/movies' do
   authorized?(Movie.all)
end

#get by id
get '/api/movies/:id' do
  puts params
  authorized?(Movie.find(params[:id]))
end

#create
post '/api/movies' do
  puts params
  Movie.create({
    :title => params[:title],
    :yearrelease => params[:yearrelease],
    :productionbudget => params[:productionbudget],
    :worldwidegross => params[:worldwidegross]}).to_json
end

## create
post '/api/movienumber' do
  request_body = JSON.parse(request.body.read.to_s)
  Movie.create(request_body).to_json
end





##update
put '/api/movies/:id' do

  # build movie_args
  # if params[:title].nil?

    # check request body
  # else
    # use params
  # end`

movie_args = {
  :title => params[:title], :yearrelease => params[:yearrelease], :productionbudget => params[:productionbudget], :worldwidegross => params[:worldwidegross]  }
    @movie = Movie.find(params[:id])
    @movie = update(movie_args)
    @movie.to_json
end

put '/api/movienumber/:id' do
    request_body = JSON.parse(request.body.read.to_s)
    @id = params[:id]
    @movie = Movie.find(@id)
    @movie.title = request_body[:title]
    @movie.yearrelease = request_body[:yearrelease]
    @movie.productionbudget = request_body[:productionbudget]
    @movie.worldwidegross = request_body[:worldwidegross]
    @movie.save
    @movie.to_json
end


patch '/api/movies/:id' do
    movie_args = {
    :title => params[:title], :yearrelease => params[:yearrelease], :productionbudget => params[:productionbudget], :worldwidegross => params[:worldwidegross] }
    @movie = Movie.find(params[:id])
    @movie = update(movie_args)
    @movie.to_json
end

patch '/api/movienumber/:id' do
    request_body = JSON.parse(request.body.read.to_s)
    @id = params[:id]
    @movie = Movie.find(@id)
    @movie.title = request_body[:title]
    @movie.yearrelease = request_body[:yearrelease]
    @movie.productionbudget = request_body[:productionbudget]
    @movie.worldwidegross = request_body[:worldwidegross]
    @movie.save
    @movie.to_json
end


#delete
delete '/api/movies/:id' do
    Movie.destroy(params[:id]).to_json
end
