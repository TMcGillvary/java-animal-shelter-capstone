BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS pets;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_pet_id;

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

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Roy','Daveville''s Dog', 'https://i.postimg.cc/rs5qcCqw/dog1.png', 'the cutest pupper', 'squirrel');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Dave','Mayor of Daveville', 'https://i.postimg.cc/C13wW6T2/dog2.png', 'mayorial dog', 'government');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Tyson','Leader of the Cigar Party', 'https://www.murderati.com/storage/squirrel-smoke.jpg?__SQUARESPACE_CACHEVERSION=1256940730989', 'ringleader', 'badass squirrel');

COMMIT TRANSACTION;
