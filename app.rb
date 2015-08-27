require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "movienumbers"

)

get '/' do
  movie = Movie.create({:title => '', :yearrelease => '', :productionbudget => '', :worldwidegross => ''})
end

get '/api/movies' do
  Movie.all.to_json
end

get '/api/movies/:id' do
  puts params
  Movie.find(params[:id]).to_json
end

post '/api/movies' do
  puts params
  Movie.create({
    :title => params[:title],
    :yearrelease => params[:yearrelease],
    :productionbudget => params[:productionbudget],
    :worldwidegross => params[:worldwidegross]}).to_json
end

put '/api/movies/:id' do
  movie_args = {
    :title => params[:title], :yearrelease => params[:yearrelease], :productionbudget => params[:productionbudget], :worldwidegross => params[:worldwidegross]  }


    @movie = Movie.find(params[:id])
    @movie = update(movie_args)
    @movie.to_json
end

patch '/api/movies/:id' do
  movie_args = {
    :title => params[:title], :yearrelease => params[:yearrelease], :productionbudget => params[:productionbudget], :worldwidegross => params[:worldwidegross] }

      @movie = Movie.find(params[:id])
      @movie = update(movie_args)
      @movie.to_json
end


delete '/api/movies/:id' do
  Movie.destroy(params[:id]).to_json
end
