DROP TABLE IF EXISTS collections;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
id SERIAL8 primary key,
name VARCHAR(255) not null,
type VARCHAR(255),
stock INT8,
url VARCHAR(255)
);

CREATE TABLE collections (
id SERIAL8 primary key,
name VARCHAR(255) not null,
markdown INT8,
product_id INT8 references products(id)
);


