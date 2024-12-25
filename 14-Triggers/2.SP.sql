

SELECT COUNT(*) from "user"
	where username='fernando' and
	password = crypt('123456', password);



CREATE or REPLACE PROCEDURE user_login(user_name VARCHAR, user_password VARCHAR) AS
$$
DECLARE
	was_found BOOLEAN;
BEGIN
	SELECT COUNT(*) into was_found from "user"
		where username= user_name and
		password = crypt( user_password, password);
	
	IF( was_found = false ) THEN
		INSERT INTO session_failed(username, "when") 
		VALUES (user_name, now());
		COMMIT;
		raise EXCEPTION 'User or password not found';	
	END IF;
 
 	UPDATE "user" set last_login = now() WHERE username = user_name;
 	COMMIT;
	raise notice 'User found %', was_found;
END;
$$ LANGUAGE plpgsql;


CALL user_login('fernando', '123454')
