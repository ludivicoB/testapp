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

-- DELIMITER //
-- CREATE PROCEDURE InsertUser(IN p_firstname VARCHAR(255), IN p_lastname VARCHAR(255), IN p_email VARCHAR(255), IN p_password VARCHAR(255))
-- BEGIN
--     DECLARE p_user_id INT;

--     -- Check if the email already exists
--     IF (SELECT COUNT(*) FROM user WHERE email = p_email) > 0 THEN
--         SIGNAL SQLSTATE '45000'
--             SET MESSAGE_TEXT = 'Email already exists. Please choose a different email.';
--     ELSE
--         -- If the email doesn't exist, proceed with the insertion
--         INSERT INTO user (firstname, lastname, email, password)
--         VALUES (p_firstname, p_lastname, p_email, p_password);

--         -- Get the last inserted user ID
--         SET p_user_id = LAST_INSERT_ID();

--         -- Return the user ID
--         SELECT p_user_id as id;
--     END IF;
-- END //
-- DELIMITER ;


-- CALL InsertUser('Clark', 'Kent', 'ck@gmail', '1234');


DELIMITER //
CREATE PROCEDURE UpdateUser(
    IN p_userid INT,
    IN p_firstname VARCHAR(255),
    IN p_lastname VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE user_exists INT;

    -- Check if the user with the specified userid exists
    SELECT COUNT(*) INTO user_exists FROM user WHERE userid = p_userid;

    IF user_exists > 0 THEN
        -- If the user exists, proceed with the update
        UPDATE user
        SET firstname = p_firstname,
            lastname = p_lastname,
            email = p_email,
            password = p_password
        WHERE userid = p_userid;
        SELECT p_userid AS id;
    ELSE
        -- If the user is not found, return 0
        SELECT 0 AS id;
    END IF;
END //
DELIMITER ;


