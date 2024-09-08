CREATE SEQUENCE user_sequence;

DROP SEQUENCE user_sequence;

SELECT
    nextval ('user_sequence');

SELECT
    currval ('user_sequence'),
    nextval ('user_sequence'),
    currval ('user_sequence');

CREATE TABLE
    users6 (
        user_id INTEGER DEFAULT nextval ('user_sequence') PRIMARY KEY,
        username VARCHAR
    )