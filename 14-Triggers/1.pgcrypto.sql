
/* instalacion de la extension  */
CREATE EXTENSION pgcrypto;


INSERT INTO
	"user" (username, password)
VALUES(
	'fernando', 
	crypt('123456', gen_salt('bf'))
);

SELECT * from "user"
	where username='fernando' and
	password = crypt('123456', password);







