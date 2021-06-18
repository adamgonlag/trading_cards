get '/listings/add' do
    card_id = params[:card_id]

    erb :'listings/new', locals: {card_id: card_id}
end

# get available listings of a character
get '/listings/character/:id' do 
    id = params[:id]

    listings = get_listings_by_character(id)

    p listings

    erb :'characters/show', locals: {listings:listings}
end

post '/listings' do
    price = params[:price]
    card_id = params[:card_id]
    user = current_user()
    user_id = user["id"]

    create_card_listing(user_id, card_id, price)
    redirect '/cards'
end

get '/listings/:id' do
    listing_id = params[:id]

    result = get_listing_by_id(listing_id)
    error_message = nil

    erb :'listings/show', locals: {result:result, error_message: error_message}

end

delete '/listings' do
    listing_id = params[:listing_id]

    delete_card_listing(listing_id)

    redirect '/cards'
end

get '/listings/edit/:id' do
    id = params[:id]
    result = get_listing_by_id(id)

    erb :'listings/edit', locals: {result: result}
end


put '/listings' do
    listing_id = params[:listing_id]
    price = params[:price]

    edit_card_listing(listing_id, price)

    redirect "/listings/#{listing_id}"

end
