BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS application_status;


DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_pet_id;
DROP SEQUENCE IF EXISTS seq_application_id;
DROP SEQUENCE IF EXISTS seq_application_status_id;



CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_pet_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_application_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_application_status_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE pets (
  pet_id int DEFAULT nextval('seq_pet_id'::regclass) NOT NULL,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  is_adoptable BOOLEAN DEFAULT true,
  pic VARCHAR(200) DEFAULT 'https://via.placeholder.com/150x150.png',
  breed VARCHAR(200),
  pet_type VARCHAR(200),
  CONSTRAINT PK_pet PRIMARY KEY (pet_id)
);

CREATE TABLE application_status (
  application_status_id int DEFAULT nextval('seq_application_status_id'::regclass) NOT NULL,
  application_status VARCHAR(50) DEFAULT 'Pending' NOT NULL,
  CONSTRAINT PK_application_status PRIMARY KEY (application_status_id)
  );
  
CREATE TABLE applications (
  application_id int DEFAULT nextval('seq_application_id'::regclass) NOT NULL,
  application_status_id int NOT NULL,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL, 
  phone VARCHAR(50) NOT NULL,
  description VARCHAR(250) NOT NULL,
  CONSTRAINT PK_application_id PRIMARY KEY (application_id),
  CONSTRAINT FK_application_status_id FOREIGN KEY (application_status_id) REFERENCES application_status (application_status_id)
  );

  

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Roy','Daveville''s Dog', 'https://i.postimg.cc/rs5qcCqw/dog1.png', 'the cutest pupper', 'squirrel');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Dave','Mayor of Daveville', 'https://i.postimg.cc/C13wW6T2/dog2.png', 'mayorial dog', 'government');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Tyson','Leader of the Cigar Party', 'https://www.murderati.com/storage/squirrel-smoke.jpg?__SQUARESPACE_CACHEVERSION=1256940730989', 'ringleader', 'badass squirrel');

INSERT INTO application_status (application_status) VALUES ('Pending');
INSERT INTO application_status (application_status) VALUES ('Approved');
INSERT INTO application_status (application_status) VALUES ('Denied');

COMMIT TRANSACTION;
