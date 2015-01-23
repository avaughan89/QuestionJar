get '/' do
  erb :login
end

# user.surveys.find(1).responses find!
# user.surveys.create(title: "gold club", question: "wanna gold club?") Link!
#--------------------------------SESSIONS-------------------------

get '/sessions/new' do
  erb :login
end

# login route
post '/sessions' do
  user = User.find_by(email: params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end

#----------USERS --------

get '/users/new' do
  @user = User.new
  erb :login
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:id] = user.id
    redirect '/'
  else
    erb :login
  end
end

get '/users/:id' do
  @user = User.find(session[:user_id])
  p @user
  erb :home
end


#------------Survey -------
post '/users/:id/surveys' do
  @user = User.find(params[:id])
  survey = Survey.create(question: params[:question], user_id: @user.id, title: params[:title])
  @user.surveys << survey
  erb :home
end

get '/users/:user_id/surveys/:survey_id' do
  @user = User.find(params[:user_id])
  @survey = Survey.find(params[:survey_id])
  erb :survey
end

get '/users/:user_id/surveys/:survey_id/reponses' do
  # @user = User.find(session[:id])

  # Response.create(user_id: session[:id] survey_id: params[id], response: params[:response])
end

post '/users/:user_id/surveys/:survey_id' do
  Response.create(user_id: params[:user_id], survey_id: params[:survey_id], response: params[:response])
end
