get '/sign-up' do 
    erb :'/users/new'
end

# Create new user in the DB
post '/users/new' do
    username = params[:username]
    email = params[:email]
    password = params[:password]

    create_user(username, email, password)

    redirect '/'
end