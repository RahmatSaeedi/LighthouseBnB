\c postgres;
DROP DATABASE IF EXISTS lightbnb;


CREATE DATABASE lightbnb;
\c lightbnb;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL
);



CREATE TABLE property_types (
  id SERIAL PRIMARY KEY,
  type TEXT NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  thumbnail_photo_url TEXT NOT NULL,
  cover_photo_url TEXT NOT NULL,
  cost_per_night DECIMAL NOT NULL,
  street VARCHAR(255) NOT NULL,
  country TEXT NOT NULL DEFAULT 'Canada',
  city VARCHAR(255) NOT NULL,
  province VARCHAR(25) NOT NULL,
  post_code VARCHAR(255) NOT NULL,
  parking_spaces SMALLINT NOT NULL DEFAULT 0,
  number_of_bedrooms SMALLINT NOT NULL DEFAULT 0,
  number_of_washrooms SMALLINT NOT NULL DEFAULT 0,
  property_type INTEGER NOT NULL DEFAULT 1,
  active BOOLEAN NOT NULL DEFAULT TRUE
);


CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INTEGER NOT NULL REFERENCES reservations(id) ON DELETE CASCADE,
  message TEXT,
  rating SMALLINT NOT NULL
);

\dt