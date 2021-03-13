CREATE TABLE "customs" (
  "id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "email" VARCHAR(50),
  "phone" VARCHAR(50),
  "gender" VARCHAR(50),
  "delivery_city" VARCHAR(8) not null unique,
  "the_custom_number" INT,
  "credit_card" VARCHAR(50)
);

CREATE TABLE "delivery_city" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(8) not null unique,
  "name_of_country" VARCHAR(7)
);

CREATE TABLE "shipping_cost" (
  "id" SERIAL PRIMARY KEY,
  "cost" VARCHAR(4) not null unique
);

CREATE TABLE "payment" (
  "id" SERIAL PRIMARY KEY,
  "payment_product" INT,
  "payment_shipping" VARCHAR(4) not null unique
);

CREATE TABLE "product_inspection" (
  "id" SERIAL PRIMARY KEY,
  "inspect" VARCHAR(7) not null unique,
  "damage_to_the_product" VARCHAR(6) not null unique
);

CREATE TABLE "product_sending" (
  "id" SERIAL PRIMARY KEY,
  "sending" VARCHAR(7) not null unique
);

ALTER TABLE "customs" ADD FOREIGN KEY ("delivery_city") REFERENCES "delivery_city" ("name");

ALTER TABLE "delivery_city" ADD FOREIGN KEY ("id") REFERENCES "shipping_cost" ("id");

ALTER TABLE "payment" ADD FOREIGN KEY ("payment_shipping") REFERENCES "shipping_cost" ("cost");

ALTER TABLE "product_inspection" ADD FOREIGN KEY ("id") REFERENCES "payment" ("id");

ALTER TABLE "product_inspection" ADD FOREIGN KEY ("inspect") REFERENCES "product_sending" ("sending");


insert into customs (id, first_name, last_name, email, phone, gender, delivery_city, the_custom_number, credit_card) values (1, 'Jackqueline', 'Drewry', 'jdrewry0@a8.net', '+299 429 744 3155', 'Non-binary', 'Kyiv', 82, '5183676465305238');
insert into customs (id, first_name, last_name, email, phone, gender, delivery_city, the_custom_number, credit_card) values (2, 'Riki', 'Khristyukhin', 'rkhristyukhin1@businessweek.com', '+54 888 257 2867', 'Genderfluid', 'New York', 60, '6706485650167049');
insert into customs (id, first_name, last_name, email, phone, gender, delivery_city, the_custom_number, credit_card) values (3, 'Brendan', 'Vittle', 'bvittle2@comcast.net', '+351 746 227 9600', 'Male', 'Berlin', 23, '5602256714384434');
insert into customs (id, first_name, last_name, email, phone, gender, delivery_city, the_custom_number, credit_card) values (4, 'Steward', 'Rapps', 'srapps3@github.io', '+63 923 505 0092', 'Female', 'Madrid', 50, '3581587922074965');
insert into customs (id, first_name, last_name, email, phone, gender, delivery_city, the_custom_number, credit_card) values (5, 'Lilyan', 'Marsden', 'lmarsden4@oaic.gov.au', '+62 602 177 8542', 'Polygender', 'London', 99, '3553083040315047');


insert into delivery_city (id, name, name_of_country) values (1, 'Kyiv', 'Ukraine');
insert into delivery_city (id, name, name_of_country) values (2, 'New York', 'USA');
insert into delivery_city (id, name, name_of_country) values (3, 'Berlin', 'Germany');
insert into delivery_city (id, name, name_of_country) values (4, 'Madrid', 'Spain');
insert into delivery_city (id, name, name_of_country) values (5, 'London', 'England');


insert into shipping_cost (id, cost) values (1, 100);
insert into shipping_cost (id, cost) values (2, 2500);
insert into shipping_cost (id, cost) values (3, 500);
insert into shipping_cost (id, cost) values (4, 1000);
insert into shipping_cost (id, cost) values (5, 1500);


insert into payment (id, payment_product, payment_shipping) values (1, 7892, 100);
insert into payment (id, payment_product, payment_shipping) values (2, 9340, 2500);
insert into payment (id, payment_product, payment_shipping) values (3, 9587, 500);
insert into payment (id, payment_product, payment_shipping) values (4, 1753, 1000);
insert into payment (id, payment_product, payment_shipping) values (5, 5247, 1500);


insert into product_inspection (id, inspect, damage_to_the_product) values (1, 'Yes', 'No');
insert into product_inspection (id, inspect, damage_to_the_product) values (2, 'Yees', 'Noo');
insert into product_inspection (id, inspect, damage_to_the_product) values (3, 'Yeees', 'Nooo');
insert into product_inspection (id, inspect, damage_to_the_product) values (4, 'Yeeees', 'Noooo');
insert into product_inspection (id, inspect, damage_to_the_product) values (5, 'Yeeeees', 'Nooooo');


insert into product_sending (id, sending) values (1, 'Yes');
insert into product_sending (id, sending) values (2, 'Yees');
insert into product_sending (id, sending) values (3, 'Yeees');
insert into product_sending (id, sending) values (4, 'Yeeees');
insert into product_sending (id, sending) values (5, 'Yeeeees');