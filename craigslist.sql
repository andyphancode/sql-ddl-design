DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    hashed_pw TEXT NOT NULL
);

CREATE TABLE regions
(
    region_id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE categories
(
    category_id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE posts
(
    post_id SERIAL PRIMARY KEY,
    post_content TEXT NOT NULL,
    post_title TEXT NOT NULL,
    post_location TEXT NOT NULL,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);

INSERT INTO users (username, hashed_pw) VALUES ('firstuser', 'abcd1234');

INSERT INTO regions (region_name) VALUES ('Regionland');

INSERT INTO categories (category_name) VALUES ('Comedy');

INSERT INTO posts
    (post_content, post_title, post_location, user_id, region_id, category_id)
VALUES
    ('THis is the first post', 'First Post', 'Firstpostland', 1, 1, 1);