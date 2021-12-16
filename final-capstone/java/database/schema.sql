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

/* Users to insert, user and Drew's account commented out for demo purposes */
-- INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'Test Testerson', 'test@test.com', '123-111-2222', false);
INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'Admin Adminson', 'admin@admin.com', '333-444-5555', true);
INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('tiffany','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'Tiffany McGillvary', 'tiffany@daveanimalshelter.com', '888-867-5309', true);
-- INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('drew','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'Drew Atkins', 'drew@daveanimalshelter.com', '888-867-5309', true);
INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('angela','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'Angela Livezey', 'angela@daveanimalshelter.com', '888-867-5309', true);
INSERT INTO users (username, password_hash, role, full_name, email, phone, has_logged_in) VALUES ('ren','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 'Ren Lewis', 'ren@daveanimalshelter.com', '888-867-5309', false);

/* Application Statuses, DO NOT CHANGE */
INSERT INTO application_status (application_status_id, application_status) VALUES (1, 'Pending');
INSERT INTO application_status (application_status_id, application_status) VALUES (2, 'Approved');
INSERT INTO application_status (application_status_id, application_status) VALUES (3, 'Denied');

/* Dummy application data */
INSERT INTO applications (application_status_id, name, email, phone, description) VALUES ('1', 'Peggy Sue', 'peggy.sue@gmail.com', '513-123-4567', 'I am only a test');
INSERT INTO applications (application_status_id, name, email, phone, description) VALUES ('1', 'Johnny Cash', 'cash4cash@gmail.com', '123-421-9999', 'Folsom Prison Blues makes me good with animals');
insert into applications (application_status_id, name, email, phone, description) values ('1', 'Haleigh Jenny', 'hjenny0@linkedin.com', '588-610-3567', 'Pick me.');
insert into applications (application_status_id, name, email, phone, description) values ('1', 'Tracey Sharman', 'tsharman1@mediafire.com', '913-406-5850', 'I''m a local celebrity.');
insert into applications (application_status_id, name, email, phone, description) values ('1', 'Peggy Ivanisov', 'pivanisov2@mtv.com', '222-841-1909', 'I am a representative of the Kentucky Horse Gods.');
insert into applications (application_status_id, name, email, phone, description) values ('1', 'Manon Skeats', 'mskeats3@infoseek.co.jp', '185-402-4876', 'Local Latin expert great at naming pets.');
insert into applications (application_status_id, name, email, phone, description) values ('1', 'Kev MacCroary', 'kmaccroary4@nyu.edu', '927-329-0188', 'One time I got lost in New York and was rescued by pigeons, I''ve been an animal lover ever since!');

/* Pets For Adoption */
insert into pets (name, description, pic, breed, pet_type) values ('Giacobo', 'Fierce feline looking for a home that will allow her to mimick her native jungle ways.', 'https://allaboutcats.com/wp-content/uploads/2020/10/Bengal-cat.jpg', 'Bengal', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Charlene', 'He has the bluest eyes in all the land, and the biggest heart to match. Just wants to chat with someone all day. Good for multi-pet households!', 'https://www.pumpkin.care/blog/wp-content/uploads/2020/11/10-Best-Names-For-Siamese-Cats-1200x628.jpg', 'Siamese', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Clarabelle', 'Relaxed mid-age cat, looking for a home that has no children and will allow her to peacefully nap the day away', 'https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg', 'Persian', 'Cat');

insert into pets (name, description, pic, breed, pet_type) values ('Cathie', 'She may look like a snoozer but this feline is full of energy and ready to play or pounce at any opportunity.', 'https://petallianceorlando.org/wp-content/uploads/2014/11/cat-laying-down.jpg', 'Striped Tabby', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Madelene', 'Affectionate, playful, and LOVES her meow mix.', 'https://checkmember.com/wp-content/uploads/2019/11/Orange-tabby-cat-wiith-alien-green-eyes-e1574969221248.jpg', 'Orange Tabby', 'Cat');
insert into pets (name, description, pic, breed, pet_type) values ('Xymenes', 'Emperor of the kitchen floor, loves to be pushed around like a mop, prefers wet food.', 'https://www.rover.com/blog/wp-content/uploads/2019/07/Himalayan-sitting-on-floor.jpg', 'Himalayan', 'Cat');

insert into pets (name, description, pic, breed, pet_type) values ('Augustus', 'Senior dog - looking for a loving family with a comfy couch and views that allow him to see the squirrels and rabbits outside.', 'https://dogopedia.net/wp-content/uploads/2018/09/How-To-Train-a-Dog-to-Lie-Down.jpg', 'Chocolate Lab', 'Dog');
insert into pets (name, description, pic, breed, pet_type) values ('Pascale', 'Senior dog - looking for a loving home with children to protect and play with.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsVvfanIQW3M2RwVtaD0nf8BeE74r-mUqT-g&usqp=CAU', 'Golden Retriever', 'Dog');
insert into pets (name, description, pic, breed, pet_type) values ('Duke', 'The biggest lap dog, loves other pups!', 'https://storage.googleapis.com/petbacker/images/blog/2017/german-shepherd-is-happy.jpg', 'German Shepherd', 'Dog');

INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Roy','Named after ROYGBIV color wheel, one of our longest running residents at the shelter.', 'https://i.postimg.cc/rs5qcCqw/dog1.png', 'Cocker Spaniel', 'Dog');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Dave','Voted to be the Mayor of Daveville''s look-a-like, one of our most popular pups!', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNWBYvFHfc9RaM3PLoHRPnssW3edR4a9orIg&usqp=CAU', 'Retriever Mix', 'Dog');
INSERT INTO pets (name,description,pic,breed,pet_type) VALUES ('Tyson','WHAT''S UP CODERS? Guaranteed to brighten up every room he''s in.', 'https://1.bp.blogspot.com/-zD25B2DiraE/XWdvS58yc2I/AAAAAAAADXw/zrIUj_mIQxI6sRpPRf0dhkkw_M9zWxfcgCLcBGAs/s1600/irish%2Bsetter.jpg', 'Golden Retriever', 'Dog');


/* Adopted Pets */
insert into pets (name, description, is_adoptable, pic, breed, pet_type) values ('Miss Blu', 'LOVES playing outside, and napping with her blanket.', false, 'https://img.nickpic.host/qEUC4D.jpg', 'Thai Ridgeback', 'Dog');
insert into pets (name, description, is_adoptable, pic, breed, pet_type) values ('Ally Mae', 'Energetic, sassy, yorkie who loves to be outside chasing squirrels.', false, 'https://img.nickpic.host/qEUQP5.jpg', 'Yorkie', 'Dog');
insert into pets (name, description, is_adoptable, pic, breed, pet_type) values ('Mike', 'The littlest pup, an underdog, training to become an all-star scrum master.', false, 'https://img.nickpic.host/qE17oM.png', 'Mutt', 'Dog');

COMMIT TRANSACTION;
