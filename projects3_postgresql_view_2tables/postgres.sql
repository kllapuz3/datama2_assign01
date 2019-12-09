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
    CONSTRAINT employee_pkey PRIMARY KEY (id),
    CONSTRAINT client_id_fkey FOREIGN KEY (client_id) REFERENCES gppasaporte.client(id) ON UPDATE CASCADE ON DELETE RESTRICT
);


INSERT INTO public.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (1,1,'Heihei','Ecnalubma','X.','5555# Sta. Rosa St. Pateros City',87000);


INSERT INTO public.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (2,2,'Amadeus','Volhoski','D.','4514# Reverid St. Tagui City',55555);

INSERT INTO public.client(
id, client_num, client_fname, client_lname, client_initial, client_address, client_contact) 
VALUES (3,3,'Weeeww','Eksdii','W.','42069# Uwu St. Gamer City',6666);


INSERT INTO gppasaporte.employee
(emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob, client_id)
VALUES(1, 'Mitsuki', 'Isutsukakushi', 'D.', '5050# Japan St. Manila City', '2021-08-20 00:00:00.000', 1);

INSERT INTO gppasaporte.employee
(emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob, client_id)
VALUES (2,'Rejolio','Santiago','J.','5555# Refiro St. Cebu City','2021-09-02 00:00:00.000', 2);


INSERT INTO public.employee
(emp_num, emp_fname, emp_lname, emp_initial, emp_address, emp_dob)
VALUES (0,'Leticia','Refaula','Z.','7777# Victorious St. Vatican City','2021-07-07 00:00:00.000');




CREATE VIEW gppasaporte.employee_client AS
SELECT
   client.id,
   client.client_fname,
   client.client_lname,
   client.client_initial,
   client.client_contact,
   client.client_address
FROM
   gppasaporte.client
INNER JOIN gppasaporte.employee ON gppasaporte.employee.emp_num = gppasaporte.client.client_num;