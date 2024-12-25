

CALL user_login('fernando', '123456');


CREATE OR REPLACE TRIGGER create_session_trigger AFTER UPDATE on "user" 
FOR EACH ROW 
WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login) 
EXECUTE FUNCTION create_session_log();


CREATE OR REPLACE FUNCTION create_session_log() 
RETURNS TRIGGER as $$
BEGIN
	INSERT INTO "session" (user_id, last_login) VALUES (NEW.id, now());
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


