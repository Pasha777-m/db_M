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
