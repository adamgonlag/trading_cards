def all_characters()
    run_sql("SELECT * FROM characters;").to_a

end

def get_characters(query)
    query = "%#{query}%"
    params = [query]
    sql_query = "SELECT * FROM characters WHERE name ILIKE $1;"
    run_sql(sql_query, params).to_a

end

def character_by_name(name)
    params = [name]
    sql_query = "SELECT * FROM characters WHERE name = $1;"
    run_sql(sql_query, params).first
end

def create_character(name, marvel_id, initial_price, backstory, image_url, quantity_released, num_comics)
    params = [name, marvel_id, initial_price, backstory, image_url, quantity_released, num_comics]
    sql_query = "INSERT INTO characters(name, marvel_id, initial_price, backstory, image_url, quantity_released, num_comics) values($1, $2, $3, $4, $5, $6, $7);"
    run_sql(sql_query, params)

    # get id of newly created character
    id = character_by_name(name)["id"]

    # Create cards based on quantity_released
    create_card(id, quantity_released)


end

def character_by_id(id)
    sql_query = "SELECT * FROM characters WHERE id = $1;"
    run_sql( sql_query, [id] ).first

end

def edit_character(id, name, marvel_id, initial_price, backstory, image_url, quantity_released, num_comics)
    params = [id, name, marvel_id, initial_price, backstory, image_url, quantity_released, num_comics]
    sql_query = "UPDATE characters SET name = $2, marvel_id = $3, initial_price = $4, backstory = $5, image_url = $6, quantity_released = $7, num_comics = $8 WHERE id = $1;"
    run_sql( sql_query, params ) 
end

def delete_character(id)
    sql_query = "DELETE FROM characters WHERE id = $1;"
    run_sql(sql_query, [id])
end