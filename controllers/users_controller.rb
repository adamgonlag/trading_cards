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

get '/users/profile' do
    user = current_user()

    if user
        erb :'users/show', locals: { user: user}
    else
        redirect '/login'
    end

end

put '/users/profile' do
    user = current_user()
    username = params[:username]
    email = params[:email]
    update_user(user["id"], username, email)

    redirect '/users/profile'
end