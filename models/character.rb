def all_characters()
    run_sql("SELECT * FROM characters;")

end

def create_characters(name, marvel_id, intitial_price, backstory, image_url, quantity_released, card_type, date_created, num_comics)
    params = [name, marvel_id, intitial_price, backstory, image_url, quantity_released, card_type, date_created, num_comics]
    sql_query = "INSERT INTO characters(name, marvel_id, intitial_price, backstory, image_url, quantity_released, card_type, date_created, num_comics) values($1, $2, $3, $4, $5, $6, $7, $8);"
    run_sql(sql_query, params)

end

def character_by_id(id)
    sql_query = "SELECT * FROM characters WHERE id = $1;"
    run_sql( sql_query, [id] ).first

end

def edit_character(id, name, marvel_id, intitial_price, backstory, image_url, quantity_released, card_type, date_created, num_comics)
    params = [id, name, marvel_id, intitial_price, backstory, image_url, quantity_released, card_type, date_created, num_comics]
    sql_query = "UPDATE characters SET name = $2, marvel_id = $3, intitial_price = $4, backstory = $5, image_url = $6, quantity_released = $7, card_type = $8, date_created = $9, num_comics = $10 WHERE id = $1;"
    run_sql( sql_query, params ) 
end

def delete_character(id)
    sql_query = "DELETE FROM characters WHERE id = $1;"
    run_sql(sql_query, [id])
end