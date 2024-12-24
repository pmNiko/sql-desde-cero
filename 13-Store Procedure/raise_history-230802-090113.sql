-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: vivo
-- Generation Time: 2023-07-29 12:44:25.9870
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."raise_history";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS raise_history_id_seq;

-- Table Definition
CREATE TABLE "public"."raise_history" (
    "id" int4 NOT NULL DEFAULT nextval('raise_history_id_seq'::regclass),
    "date" date,
    "employee_id" int4,
    "base_salary" numeric(8,2),
    "amount" numeric(8,2),
    "percentage" numeric(4,2),
    PRIMARY KEY ("id")
);

