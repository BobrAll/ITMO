DROP TABLE IF EXISTS store_chain CASCADE;
DROP TABLE IF EXISTS store CASCADE;
DROP TABLE IF EXISTS storage CASCADE;
DROP TABLE IF EXISTS item CASCADE;
DROP TABLE IF EXISTS title CASCADE;
DROP TABLE IF EXISTS provider CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS machine CASCADE;
DROP TABLE IF EXISTS deal CASCADE;

CREATE TABLE store_chain(
  id SERIAL PRIMARY KEY,
  name TEXT
);
  
CREATE TABLE store(
  id SERIAL PRIMARY KEY,
  address TEXT,
  store_chain_id INT REFERENCES store_chain(id)
);

CREATE TABLE storage(
  id SERIAL PRIMARY KEY,
  store_id INT REFERENCES store(id),
  max_items INT,
  storage_temperature INT
);

CREATE TABLE employee(
  id SERIAL PRIMARY KEY,
  role TEXT
);

CREATE TABLE machine(
  id SERIAL PRIMARY KEY,
  storage_id INT REFERENCES storage(id),
  employee_id INT REFERENCES employee(id),
  load_capacity INT
);

CREATE TABLE title(
  id SERIAL PRIMARY KEY,
  value TEXT
);

CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  title_id INT REFERENCES title(id),
  storage_temperature INT,
  expiration_date DATE,
  storage_id INT REFERENCES storage(id)
);
 
CREATE TABLE provider(
  id SERIAL PRIMARY KEY,
  name TEXT,
  title_id INT REFERENCES title(id),
  item_value INT
);

CREATE TABLE payment(
  id SERIAL PRIMARY KEY,
  value MONEY
);

CREATE TABLE deal(
  id SERIAL PRIMARY KEY,
  items_value INT,
  provider_id INT REFERENCES provider(id),
  storage_id INT REFERENCES storage(id),
  payment_id INT REFERENCES payment(id)
);
