def all_cards()
    run_sql("SELECT * FROM cards;")

end

# Only run when a new character is created by admin
def create_card(character_id, quantity_released)
    available = true #default value
    quantity_released.to_i.times do |card_edition|
        params = [character_id, card_edition + 1, available]
        sql_query = "INSERT INTO cards(character_id, card_edition, available) values($1, $2, $3);"
        run_sql(sql_query, params)
    end

end

def get_card_by_id(card_id)
    sql_query = "SELECT cards.*, characters.name, characters.initial_price, characters.backstory, characters.image_url, characters.quantity_released, characters.num_comics FROM cards INNER JOIN characters ON cards.character_id=characters.id WHERE cards.id = $1;"
    run_sql( sql_query, [card_id]).first

end

def get_all_character_cards(character_id)
    sql_query = "SELECT * FROM cards INNER JOIN characters ON cards.character_id=characters.id WHERE characters.id = $1;"
    run_sql( sql_query, [character_id]).to_a

end

def get_user_collection(user_id)
    sql_query = "SELECT * FROM cards INNER JOIN users ON cards.owner_id=users.id INNER JOIN characters ON cards.character_id=characters.id WHERE users.id = $1;"
    run_sql( sql_query, [user_id]).to_a
end

def get_available_character_cards(character_id)
    sql_query = "SELECT cards.*, characters.name, characters.initial_price, characters.backstory, characters.image_url, characters.quantity_released, characters.num_comics FROM cards INNER JOIN characters ON cards.character_id=characters.id WHERE characters.id = $1 AND cards.available = 't';"
    run_sql( sql_query, [character_id]).to_a
end

def edit_card(id, owner_id, character_id, card_edition)
    params = [id, owner_id, character_id, card_edition]
    sql_query = "UPDATE cards SET owner_id = $2, character_id = $3, card_edition = $4 WHERE id = $1;"
    run_sql( sql_query, params ) 
end

def delete_card(id)
    sql_query = "DELETE FROM cards WHERE id = $1;"
    run_sql(sql_query, [id])
end

def add_to_collection(user_id, id)
    params = [user_id, id]
    sql_query = "UPDATE cards SET owner_id = $1, available = false WHERE id = $2"
    run_sql(sql_query, params)
end

