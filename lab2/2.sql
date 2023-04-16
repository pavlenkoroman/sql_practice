USE online_store;

CREATE TABLE products
(
    id           int primary key IDENTITY (1, 1) NOT NULL,
    manufacturer varchar(255)                    NOT NULL,
    title        varchar(255)                    NOT NULL,
    price        decimal(19, 0)                  NOT NULL
);

CREATE TABLE online_stores
(
    id    int primary key IDENTITY (1, 1) NOT NULL,
    url   varchar(255) UNIQUE             NOT NULL CHECK (url LIKE '%https://'),
    title varchar(255)                    NOT NULL
);

CREATE TABLE orders
(
    id              int primary key IDENTITY (1, 1) NOT NULL,
    has_delivery    bit                             NOT NULL,
    total_price     decimal(19, 0)                  NOT NULL,
    product_id      int unique REFERENCES products (id),
    online_store_id int unique REFERENCES online_stores (id)
);

CREATE TABLE deliveries
(
    track_number         int primary key IDENTITY (1, 1) NOT NULL,
    delivery_address     varchar(255)                    NOT NULL,
    customer_first_name  varchar(255)                    NOT NULL,
    customer_second_name varchar(255)                    NOT NULL,
    contact_details      varchar(255)                    NOT NULL,
    order_number         int unique REFERENCES orders (id)
);

CREATE TABLE product_online_stores
(
    product_id      int unique REFERENCES products (id),
    online_store_id int unique REFERENCES online_stores (id)
);