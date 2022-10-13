CREATE TABLE music_albums (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    genre_id INT,
    ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id);
    PRIMARY KEY(id)
);

CREATE TABLE genres (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);
