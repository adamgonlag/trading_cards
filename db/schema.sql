CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name TEXT,
    marve_id TEXT,
    initial_price int,
    backstory TEXT,
    image_url TEXT,
    quantity_released int,
    card_type TEXT,
    date_created DATETIME,
    num_comics int,
);

CREATE TABLE cards (
    id SERIAL PRIMARY KEY,
    owner_id int,
    character_id int,
    card_edition int
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT,
    total_tokens INT
);