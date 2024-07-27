
CREATE TABLE types (
    type_id INT PRIMARY KEY NOT NULL,
    type_name VARCHAR(100) NOT NULL                                     
);

CREATE TABLE users (
    user_id INT PRIMARY KEY NOT NULL,
    fio VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    login VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    type_id INT NOT NULL,                                               
    FOREIGN KEY (type_id) REFERENCES types(type_id)
);

CREATE TABLE status (
    status_id INT PRIMARY KEY NOT NULL,                                 
    name VARCHAR(100) NOT NULL
);

CREATE TABLE part_requst (
    part_requst_id INT PRIMARY KEY NOT NULL,
    reseived VARCHAR(100) NOT NULL,
    part_id INT NOT NULL,                                                
    request_id INT,
    FOREIGN KEY (part_id) REFERENCES  parts(part_id),
    FOREIGN KEY (request_id) REFERENCES requests (request_id)
);

CREATE TABLE parts (
    part_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL                                            
);

CREATE TABLE cars (
    car_id INT PRIMARY KEY NOT NULL,
    type_id INT,
    model_id INT,
    drand_id INT,                                                         
    FOREIGN KEY (type_id) REFERENCES car_types (type_id),
    FOREIGN KEY (model_id) REFERENCES car_models (model_id),
    FOREIGN KEY (drand_id) REFERENCES car_brands (drand_id)
);

CREATE TABLE car_types (
    type_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL                                            
);

CREATE TABLE car_models (
    model_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL                                            
);

CREATE TABLE car_brands (
    drand_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL                                            
);

CREATE TABLE requests (
    request_id INT PRIMARY KEY NOT NULL,
    start_date DATE NOT NULL,
    car_id INT,
    description VARCHAR(100) NOT NULL,
    status_id INT,
    complite_date DATE,                                                
    master_id INT,
    client_id INT,
    FOREIGN KEY (car_id) REFERENCES cars (car_id),
    FOREIGN KEY (status_id) REFERENCES status (status_id),
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
