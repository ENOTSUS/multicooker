-- Создаем базу данных
CREATE DATABASE my_database;

-- Используем созданную базу данных
USE my_database;

-- Создаем таблицы
CREATE TABLE types (
    type_id INT PRIMARY KEY NOT NULL,
    type_name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    user_id INT PRIMARY KEY NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    type_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES types(type_id)
);

CREATE TABLE home_tech_types (
    home_tech_type_id INT PRIMARY KEY NOT NULL,
    home_tech_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE home_tech_models (
    home_tech_model_id INT PRIMARY KEY NOT NULL,
    home_tech_model_name VARCHAR(50) NOT NULL,
    home_tech_type_id INT NOT NULL,
    repair_parts VARCHAR(50),
    FOREIGN KEY (home_tech_type_id) REFERENCES home_tech_types(home_tech_type_id)
);

CREATE TABLE request_statuses (
    request_status_id INT PRIMARY KEY NOT NULL,
    request_status_name VARCHAR(50) NOT NULL
);

CREATE TABLE requests (
    request_id INT PRIMARY KEY NOT NULL,
    start_date DATE NOT NULL,
    home_tech_model_id INT,
    problem_description VARCHAR(100) NOT NULL,
    request_status_id INT,
    completion_date DATE,
    master_id INT,
    client_id INT,
    FOREIGN KEY (home_tech_model_id) REFERENCES home_tech_models(home_tech_model_id),
    FOREIGN KEY (request_status_id) REFERENCES request_statuses(request_status_id),
    FOREIGN KEY (master_id) REFERENCES users(user_id),
    FOREIGN KEY (client_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY NOT NULL,
    master_id INT,
    request_id INT,
    message VARCHAR(100),
    FOREIGN KEY (master_id) REFERENCES users(user_id),
    FOREIGN KEY (request_id) REFERENCES requests(request_id)
);
