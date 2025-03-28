CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(22) NOT NULL UNIQUE
);

CREATE TABLE games (
  games_id SERIAL PRIMARY KEY,
  random_number INT NOT NULL,
  number_of_guesses INT NOT NULL,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);