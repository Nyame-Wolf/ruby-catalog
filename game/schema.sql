CREATE TABLE author (
  id BIG SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  items FOREIGN KEY (id) REFERENCES item (author_id),
);

CREATE TABLE game (
  id BIG SERIAL PRIMARY KEY,
  genre VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  label VARCHAR(255) NOT NULL,
  publisher DATE NOT NULL,
  multiplayer VARCHAR(255) NOT NULL,
  last_played DATE NOT NULL,
);
