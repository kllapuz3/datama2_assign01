CREATE USER gppasaporte WITH SUPERUSER
CREATEDB
CREATEROLE
INHERIT
REPLICATION
BYPASSRLS
IN GROUP datama2
PASSWORD '123';

CREATE DATABASE datama2
OWNER = gppasaporte;

\c datama2


CREATE TABLE client
(
    id integer NOT NULL,
    client_num integer,
    client_fname character varying(50),
    client_lname character varying(50),
    client_initial character varying(5),
    client_address character varying(50),
    client_contact integer,
    CONSTRAINT client_pkey PRIMARY KEY (id)
);

CREATE TABLE employee
(
    id integer NOT NULL,
    emp_num integer,
    emp_fname character varying(50),
    emp_lname character varying(50),
    emp_initial character varying(50),
    emp_address character varying(50),
    emp_dob timestamp(6) without time zone,
    client_id integer,
    CONSTRAINT employee_pkey PRIMARY KEY (id)
);


INSERT INTO public.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES(1, 1, 'Heihei’, 'Ecnalubma’, 'X.', '5555# Sta. Rosa St. Pateros City', 87000);


INSERT INTO public.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (2, 2, 'Amadeus', 'Volhoski’, 'D.', '4514# Reverid St. Tagui City’, 55555);

INSERT INTO public.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (3, 3, 'Weeeww', 'Eksdii', 'W.', '42069# Uwu St. Gamer City’, 6666)



CREATE VIEW AS
SELECT
   client.id,
   client.client_fname,
   client.client_lname,
   client.client_initial,
   client.client_contact,
   client.client_address
FROM
   client
INNER JOIN employee ON employee.emp_num = client.client_num;