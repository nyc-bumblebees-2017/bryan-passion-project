get '/' do
  erb :index
end

get '/search' do
  query = params[:ingredients].to_query('')
  uri = URI.parse("http://food2fork.com/api/search?key=#{ENV['ACCESS_TOKEN']}&q#{query}")
  response = Net::HTTP.get_response(uri)
  @body = JSON.parse(response.body)
  erb :search
end

get '/recipes/:recipe_id' do
  uri = URI.parse("http://food2fork.com/api/get?key=#{ENV['ACCESS_TOKEN']}&rId=#{params[:recipe_id]}")
  response = Net::HTTP.get_response(uri)
  @recipe = JSON.parse(response.body)['recipe']
  erb :recipe
end
