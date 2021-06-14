CREATE TABLE characters (
    id SERIAL PRIMARY KEY,
    name TEXT,
    marvel_id TEXT,
    initial_price int,
    backstory TEXT,
    image_url TEXT,
    quantity_released int,
    date_created TIMESTAMP,
    num_comics int
);

CREATE TABLE cards (
    id SERIAL PRIMARY KEY,
    owner_id int,
    character_id int,
    card_edition int,
    available boolean,
    CONSTRAINT fk_character
        FOREIGN KEY(character_id) 
            REFERENCES characters(id),
    CONSTRAINT fk_users
        FOREIGN KEY(owner_id) 
            REFERENCES users(id)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT,
    total_tokens INT
);

