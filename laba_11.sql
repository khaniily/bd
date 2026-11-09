--1
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    publisher_name VARCHAR(255),    -- Название издательства
    publisher_city VARCHAR(100)     -- Город, в котором находится издательство
);
--избыточность (название и город издательства повторяются для каждой книги этого издательства)

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) UNIQUE,
    publisher_city VARCHAR(100)
);
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

--2
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100),      -- Модель автомобиля
    car_manufacturer VARCHAR(100), -- Производитель автомобиля
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id)
);
-- избыточность(«Porsche» повторяется для каждого заезда каждой Cayman)
CREATE TABLE CarModels (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100) NOT NULL
);
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    FOREIGN KEY (car_model) REFERENCES CarModels(car_model)
);

--3
CREATE TABLE RoomBookings (
    booking_time DATETIME,
    room_name VARCHAR(100),
    event_name VARCHAR(255),
    event_type VARCHAR(50)
);
--избыточность (правило «Презентация -> Зал №1» повторяется в каждой строке каждой брони этого типа)
CREATE TABLE EventTypes (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL
);
CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (event_type) REFERENCES EventTypes(event_type)
);
CREATE TABLE RoomBookings (
    booking_time DATETIME,
    event_name VARCHAR(255),
    room_name VARCHAR(100),
    PRIMARY KEY (booking_time, event_name),
    FOREIGN KEY (event_name) REFERENCES Events(event_name),
    FOREIGN KEY (room_name) REFERENCES EventTypes(room_name)
);
