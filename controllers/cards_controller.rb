get '/cards' do
    user = current_user()

    if user
        collection = get_user_collection(user["id"])
        listings = get_listings_of_user(user["id"])
        erb :'cards/index', locals: {results: collection, listings: listings}
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

post '/cards/add' do
    card_id = params[:card_id].to_i
    listing_id = params[:listing_id]
    price = params[:price].to_i
    seller_id = params[:seller_id]

    user = current_user()
    if user
        if has_balance_for_purchase?(user["id"], price)
          
            update_buyer_balance(user["id"], price)
            update_seller_balance(seller_id, price)
            
            add_to_collection(user["id"], card_id)
            close_card_listing(listing_id, user["id"])

            redirect '/cards'
        else
            error_message = 'Insufficient balance'
            result = get_listing_by_id(listing_id)
            erb :'listings/show', locals: {result:result, error_message: error_message}
        end
    else
        redirect '/login'
    end
end

put "/cards" do
    card_id = params[:card_id]
    remove_from_collection(card_id)

    redirect '/'
end


delete "/cards" do
    card_id = params[:card_id]
    delete_card(card_id)
    redirect '/'
end



