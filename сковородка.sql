CREATE TABLE equipment_types (
    type_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE equipment_models (
    model_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE equipment_brands (
    brand_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE equipment (
    car_id INT PRIMARY KEY,
    type_id INT,
    model_id INT,
    brand_id INT,
    FOREIGN KEY (type_id) REFERENCES equipment_types(type_id),
    FOREIGN KEY (model_id) REFERENCES equipment_models(model_id),
    FOREIGN KEY (brand_id) REFERENCES equipment_brands(brand_id)
);

CREATE TABLE status (
    status_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE user_types (
    type_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    fio VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    login VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES user_types(type_id)
);

CREATE TABLE parts (
    part_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE requests (
    request_id INT PRIMARY KEY,
    start_date DATE,
    complete_date DATE,
    car_id INT,
    client_id INT,
    description TEXT,
    status_id INT,
    master_id INT,
    FOREIGN KEY (car_id) REFERENCES equipment(car_id),
    FOREIGN KEY (status_id) REFERENCES status(status_id),
    FOREIGN KEY (master_id) REFERENCES users(user_id),
    FOREIGN KEY (client_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    message TEXT,
    master_id INT,
    request_id INT,
    FOREIGN KEY (master_id) REFERENCES users(user_id),
    FOREIGN KEY (request_id) REFERENCES requests(request_id)
);

CREATE TABLE part_request (
    pr_id INT PRIMARY KEY,
    part_id INT,
    request_id INT,
    received BOOLEAN,
    FOREIGN KEY (part_id) REFERENCES parts(part_id),
    FOREIGN KEY (request_id) REFERENCES requests(request_id)
);
