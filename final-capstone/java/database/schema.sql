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

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	full_name VARCHAR(50) NOT NULL,
	/* email will be displayed twice, because the username is ALSO the email, but we need email separate for the contact info page */
	email VARCHAR(50) NOT NULL, 
  phone VARCHAR(50) NOT NULL,
  has_logged_in BOOLEAN DEFAULT false,
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
  application_status_id int NOT NULL,
  application_status VARCHAR(50) NOT NULL,
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


INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'Test Testerson', 'test@test.com', '123-111-2222', false);
INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'Admin Adminson', 'admin@admin.com', '333-444-5555', true);

INSERT INTO application_status (application_status_id, application_status) VALUES (1, 'Pending');
INSERT INTO application_status (application_status_id, application_status) VALUES (2, 'Approved');
INSERT INTO application_status (application_status_id, application_status) VALUES (3, 'Denied');

INSERT INTO applications (application_status_id, name, email, phone, description) VALUES('1', 'Peggy Sue', 'peggy.sue@gmail.com', '513-123-4567', 'I am only a test');
INSERT INTO applications (application_status_id, name, email, phone, description) VALUES('1', 'Johnny Cash', 'cash4cash@gmail.com', '123-421-9999', 'Folsom Prison Blues makes me good with animals');

/* Pets For Adoption */
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Roy','Daveville''s Dog', 'https://i.postimg.cc/rs5qcCqw/dog1.png', 'Cocker Spaniel', 'Dog');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Dave','Mayor of Daveville', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNWBYvFHfc9RaM3PLoHRPnssW3edR4a9orIg&usqp=CAU', 'Retriever Mix', 'Dog');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Tyson','WHAT''S UP CODERS?', 'https://1.bp.blogspot.com/-zD25B2DiraE/XWdvS58yc2I/AAAAAAAADXw/zrIUj_mIQxI6sRpPRf0dhkkw_M9zWxfcgCLcBGAs/s1600/irish%2Bsetter.jpg', 'Golden Retriever', 'Dog');

insert into pets (name, description, pic, breed, pet_type) values ('Augustus', 'visualize best-of-breed paradigms', 'https://dogopedia.net/wp-content/uploads/2018/09/How-To-Train-a-Dog-to-Lie-Down.jpg', 'Chocolate Lab', 'Dog');
insert into pets (name, description, pic, breed, pet_type) values ('Pascale', 'deliver interactive systems', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsVvfanIQW3M2RwVtaD0nf8BeE74r-mUqT-g&usqp=CAU', 'Golden Retriever', 'Dog');
insert into pets (name, description, pic, breed, pet_type) values ('Duke', 'sunshine incarnate', 'https://storage.googleapis.com/petbacker/images/blog/2017/german-shepherd-is-happy.jpg', 'German Shepherd', 'Dog');

insert into pets (name, description, pic, breed, pet_type) values ('Cathie', 'recontextualize frictionless content', 'https://petallianceorlando.org/wp-content/uploads/2014/11/cat-laying-down.jpg', 'Striped Tabby', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Madelene', 'recontextualize magnetic architectures', 'https://checkmember.com/wp-content/uploads/2019/11/Orange-tabby-cat-wiith-alien-green-eyes-e1574969221248.jpg', 'Orange Tabby', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Xymenes', 'expedite innovative interfaces', 'https://www.rover.com/blog/wp-content/uploads/2019/07/Himalayan-sitting-on-floor.jpg', 'Himalayan', 'Cat');

insert into pets (name, description, pic, breed, pet_type) values ('Giacobo', 'Mecozzi', 'https://allaboutcats.com/wp-content/uploads/2020/10/Bengal-cat.jpg', 'Bengal', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Charlene', 'Edge', 'https://www.pumpkin.care/blog/wp-content/uploads/2020/11/10-Best-Names-For-Siamese-Cats-1200x628.jpg', 'Siamese', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Clarabelle', 'Gumey', 'https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg', 'Persian', 'Cat');

/* Adopted Pets */
insert into pets (name, description, is_adoptable, pic, breed, pet_type) values ('Blue', 'incentivize granular initiatives', false, 'https://img.nickpic.host/qEUC4D.jpg', 'Thai Ridgeback', 'Dog');
insert into pets (name, description, is_adoptable, pic, breed, pet_type) values ('Allie May', 'synergize ubiquitous e-services', false, 'https://img.nickpic.host/qEUQP5.jpg', 'Yorkie', 'Dog');
insert into pets (name, description, is_adoptable, pic, breed, pet_type) values ('Mike', 'scrum master', false, 'https://img.nickpic.host/qE17oM.png', 'Chocolate Lab', 'Dog');

COMMIT TRANSACTION;
