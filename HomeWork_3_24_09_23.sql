use learn;

-- 1) Создайте таблицу staff (
-- id целое число, 
-- name, строка
-- surname, строка
-- age, целое число
-- position - строка


CREATE TABLE staff(
id integer,
name varchar(64),
surname varchar(64),
age integer,
position varchar(64)
);

-- 2) Заполните таблицу значениями из 10 строк по примеру :
-- 1,'Alex','Alexeev',24,'worker'
-- 2,'Oleg','Olegov',36,'administration'
-- ……..
-- и так далее.

INSERT INTO staff (id, name, surname, age, position) 
			VALUES(0, 'Alex', 'Alexeev', 35, 'worker'),
				  (1, 'Oleg', 'Olegov', 20, 'worker'),
                  (2, 'Maxim', 'Maximov', 48, 'security'),
                  (3, 'Andrey', 'Surov', 22, 'administration'),
                  (4, 'Sergey', 'Belov', 28, 'worker'),
                  (5, 'Ivan', 'Semikin', 33, 'security'),
                  (6, 'Olga', 'Starova', 35, 'administration'),
                  (7, 'Petr', 'Jashin', 46, 'worker'),
                  (8, 'Semen', 'Slepakov', 26, 'worker'),
                  (9, 'Mark', 'Popov', 51, 'administration');
                  
SELECT * FROM staff;

-- 3) Добавьте в уже готовую и заполненную таблицу поле salary - целое число.

ALTER TABLE staff
ADD salary integer;

-- 4) Проставьте значение поля salary следующим образом :
-- если сотрудник категории worker - 1000
-- если сотрудник категории administration - 5000
-- если сотрудник категории security - 2000

UPDATE staff 
	SET salary = 1000 
	WHERE position = 'worker';
UPDATE staff     
    SET salary = 5000
    WHERE position = 'administration';
UPDATE staff     
    SET salary = 2000
    WHERE position = 'security';
                  
SELECT * FROM staff;

-- 5) Увеличьте всем сотрудникам зарплату в два раза.
UPDATE staff     
    SET salary = salary * 2;
    
-- 6) Удалите из таблицы сотрудников, чей возраст больше чем 45.

DELETE FROM staff
WHERE age > 45;

-- 7) Создайте три представления : первое - хранит только сотрудников типа worker, 
-- второй - security,
-- третье administration

CREATE VIEW viewWorker AS
SELECT * 
FROM staff
WHERE position = 'worker';

CREATE VIEW viewSecurity AS
SELECT * 
FROM staff
WHERE position = 'security';

CREATE VIEW viewAdmin AS
SELECT * 
FROM staff
WHERE position = 'administration';   

-- 8) Создайте новую таблицу на основе выборки из таблицы staff , которая будет хранить 
-- только name,surname,position
-- сотрудников , которые относятся к administration   
     
CREATE TABLE new_staff 
SELECT name, surname, position
FROM viewAdmin;      

SELECT * FROM new_staff;

-- 9) Удалите колонку position из новой таблицы.
ALTER TABLE new_staff
DROP COLUMN position;
