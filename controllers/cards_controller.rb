get '/cards' do
    results = get_search_results()

    erb :'cards/show', locals: {results: results}
  
end

get '/cards/collection' do
    user = current_user()
    p user

    if user
        collection = get_user_collection(user["id"])
        p collection
        erb :'cards/index', locals: {results: collection}
    else
        redirect '/login'
    end

end

get '/cards/:id' do
    id = params[:id]

    result = get_card_by_id(id)
    p result
    erb :'cards/show', locals: {result:result}
end

post '/cards/collection/add' do
    card_id = params[:card_id]

    p 'card id'
    p card_id
    user = current_user()
    if user
        add_to_collection(user["id"], card_id)
        redirect '/'
    else
        redirect '/login'
    end
end



