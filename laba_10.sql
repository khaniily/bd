--1
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255),
    team_members VARCHAR(1000) -- Пример: 'Алексеев, Борисов, Васильева'
);
-- ошибка: данные не могут быть записаны в одну строку, ее атрибуты (столбцы) не являются атомарными (неделимыми). 
-- поэтому мы создаем отдельную табличку и связующую табличку
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);
CREATE TABLE Team_members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(255)
);
CREATE TABLE ProjectMembers (
    project_id INT,
    member_id INT,
    PRIMARY KEY (project_id, member_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (member_id) REFERENCES Team_members(member_id)
);
--2
CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    client_name VARCHAR(255),    -- Имя клиента
    client_email VARCHAR(255),   -- Email клиента
    equipment_name VARCHAR(255), -- Название оборудования
    rental_date DATE,            -- Дата аренды
    PRIMARY KEY (client_id, equipment_id)
);
--ошибка: присутствует частичная зависимость, есть избыточность. нужно разделить на разные таблички данные
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_email VARCHAR(255),
    client_name VARCHAR(255)
)

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
)

CREATE TABLE EquipmentRentals (
    client_id INT FOREIGN KEY,
    equipment_id INT FOREIGN KEY,
    rental_date DATE,
)
--3
CREATE TABLE StudentGrades (
    student_id INT,
    course_id INT,
    student_name VARCHAR(255),
    course_professor VARCHAR(255),
    assignments_and_grades TEXT, -- Пример содержимого: '{"Quiz 1": 85, "Midterm": 92, "Essay": 88}'
    PRIMARY KEY (student_id, course_id)
);
--ошибка: 1нф - столбец assignments_and_grades не явл автономным. 
-- 2нф - есть частичные зависимости. будет избыточность и повтор данных.

CREATE TABLE Studet (
    studet_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    professor_id INT FOREIGN KEY
);

CREATE TABLE Profеssor (
    course_professor VARCHAR(255)
    professor_id INT PRIMARY KEY
);
CREATE TABLE assignments (
    assignments_id INT PRIMARY KEY,
    assignments_name VARCHAR(255)
);
CREATE TABLE  Assignments_and_grades (
    studet_id INT FOREIGN KEY,
    course_id INT FOREIGN KEY,
    assignments_id INT FOREIGN KEY,
)
