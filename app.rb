require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "movienumbers"

)

get '/' do
  {:message => 'Not allowed. Please try
    "/api/movienumbers"'}.to_json
  end
