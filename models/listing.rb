# Only price is editable once a card is listed for sale
def get_listing_by_id(id)
    sql_query = "SELECT listings.id, listings.price, listings.card_id, listings.status, cards.card_edition, cards.available, characters.name, characters.image_url, characters.quantity_released, characters.backstory, users.username, users.id as user_id FROM listings INNER JOIN cards ON listings.card_id=cards.id INNER JOIN users ON listings.user_id=users.id INNER JOIN characters ON cards.character_id=characters.id WHERE listings.id = $1;"
    run_sql(sql_query, [id]).first

end

def get_listings_by_character(character_id)
    sql_query = "SELECT listings.*, cards.card_edition, cards.available, characters.name, characters.image_url, characters.quantity_released, users.username FROM listings INNER JOIN cards ON listings.card_id=cards.id INNER JOIN characters ON cards.character_id=characters.id INNER JOIN users ON listings.user_id=users.id WHERE characters.id = $1 AND listings.status = 'listed'"
    run_sql(sql_query, [character_id]).to_a

end

# Adds the card to the marketplace
def create_card_listing(user_id, card_id, price)
    status = "listed" #default value
    params = [user_id, card_id, price, status]
    sql_query = "INSERT INTO listings(user_id, card_id, price, status) values($1, $2, $3, $4);"
    run_sql(sql_query, params)

end

# Only price is editable once a card is listed for sale
def edit_card_listing(listing_id, price)
    params = [price, listing_id]
    sql_query = "UPDATE listings SET price = $1 WHERE id = $2;"
    run_sql(sql_query, params)

end

# Only price is editable once a card is listed for sale
def close_card_listing(listing_id, user_id)
    status = "closed"
    params = [listing_id, user_id, status]
    sql_query = "UPDATE listings SET status = $3, buyer_id = $2 WHERE id = $1;"
    run_sql(sql_query, params)

end

# User can delete card listing
def delete_card_listing(listing_id)
    sql_query = "DELETE FROM listings WHERE id = $1;"
    run_sql(sql_query, [listing_id]).first
end

def get_listings_of_user(user_id)
    sql_query = "SELECT listings.id, listings.price, listings.card_id, listings.status, cards.card_edition, cards.available, characters.name, characters.image_url, characters.quantity_released, characters.backstory, users.username FROM listings INNER JOIN cards ON listings.card_id=cards.id INNER JOIN users ON listings.user_id=users.id INNER JOIN characters ON cards.character_id=characters.id WHERE user_id = $1 and listings.status = 'listed'"
    run_sql(sql_query, [user_id]).to_a
end

def get_card_listing_by_card_id(card_id)
    sql_query = "SELECT * FROM listings WHERE card_id = $1"
    result = run_sql(sql_query, [card_id]).to_a.last

    if result
        return result
    else
        return nil
    end
end