def all_cards()
    run_sql("SELECT * FROM cards;")

end

def create_cards(character_id, card_edition)
    params = [character_id, card_edition]
    sql_query = "INSERT INTO cards(character_id, card_edition) values($1, $2);"
    run_sql(sql_query, params)

end

def cards_by_id(id)
    sql_query = "SELECT * FROM cards WHERE id = $1;"
    run_sql( sql_query, [id] ).first

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
