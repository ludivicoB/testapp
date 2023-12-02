-- DELIMITER //

-- CREATE PROCEDURE save_recipe(
--     IN p_user_id INT,
--     IN p_category_id INT,
--     IN p_title VARCHAR(255),
--     IN p_description VARCHAR(255),
--     IN p_cooking_time INT,
--     IN p_servings INT,
--     IN p_imgsrc VARCHAR(255)
-- )
-- BEGIN
--     INSERT INTO Recipe (userid, categoryid, title, description, cookingtime, servings, imgsrc)
--     VALUES (p_user_id, p_category_id, p_title, p_description, p_cooking_time, p_servings, p_imgsrc);
-- END //

-- DELIMITER ;

-- CALL save_recipe(2, 2, 'Bulalo', 'A tasty recipe of bulalo', 30, 5, 'bulalo.jpg');

-- DELIMITER //
-- CREATE PROCEDURE InsertUser(IN p_firstname VARCHAR(255), IN p_lastname VARCHAR(255), IN p_email VARCHAR(255), IN p_password VARCHAR(255))
-- BEGIN
-- 	DECLARE p_user_id INT;
--     INSERT INTO user (firstname, lastname, email, password)
--     VALUES (p_firstname, p_lastname, p_email, p_password);
--     SET p_user_id = last_insert_id();
--     SELECT p_user_id as id;
-- END //
-- DELIMITER ;

CALL InsertUser('Clark', 'Kent', 'ck@gmail', '1234');


