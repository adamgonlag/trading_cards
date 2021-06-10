def run_sql(sql_query, params = [])
    connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'trading_cards'})
    connection.prepare("query", sql_query)
    results = connection.exec_prepared('query', params)
    connection.close

    return results
end