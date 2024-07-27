-- Create table for user_types
CREATE TABLE user_types (
    type_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    fio VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    login VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES user_types(type_id)
);

-- Create table for car_brands
CREATE TABLE car_brands (
    brand_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for car_models
CREATE TABLE car_models (
    model_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for car_types
CREATE TABLE car_types (
    type_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for cars
CREATE TABLE cars (
    car_id INT PRIMARY KEY,
    type_id INT,
    model_id INT,
    brand_id INT,
    FOREIGN KEY (type_id) REFERENCES car_types(type_id),
    FOREIGN KEY (model_id) REFERENCES car_models(model_id),
    FOREIGN KEY (brand_id) REFERENCES car_brands(brand_id)
);

-- Create table for status
CREATE TABLE status (
    status_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for requests
CREATE TABLE requests (
    request_id INT PRIMARY KEY,
    start_date DATE,
    compile_date DATE,
    car_id INT,
    client_id INT,
    description TEXT,
    status_id INT,
    master_id INT,
    FOREIGN KEY (car_id) REFERENCES cars(car_id),
    FOREIGN KEY (status_id) REFERENCES status(status_id),
    FOREIGN KEY (master_id) REFERENCES users(user_id),
    FOREIGN KEY (client_id) REFERENCES users(user_id)
);

-- Create table for parts
CREATE TABLE parts (
    part_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for part_request
CREATE TABLE part_request (
    pr_id INT PRIMARY KEY,
    part_id INT,
    request_id INT,
    received BOOLEAN,
    FOREIGN KEY (part_id) REFERENCES parts(part_id),
    FOREIGN KEY (request_id) REFERENCES requests(request_id)
);

-- Create table for comments
CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    message TEXT NOT NULL,
    master_id INT,
    request_id INT,
    FOREIGN KEY (master_id) REFERENCES users(user_id),
    FOREIGN KEY (request_id) REFERENCES requests(request_id)
);
