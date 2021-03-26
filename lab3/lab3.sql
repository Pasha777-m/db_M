--1
-- Locations of clients

SELECT customs.first_name, customs.last_name, delivery_city.name, delivery_city.name_of_country
FROM customs
INNER JOIN delivery_city ON customs.delivery_city=delivery_city.name
;

--2
-- Shipping cost of clients

SELECT customs.first_name, customs.last_name, shipping_cost.cost
FROM customs
INNER JOIN shipping_cost ON customs.id=shipping_cost.id
INNER JOIN payment ON shipping_cost.id=payment.id
;

--3
-- Product cost of clients

SELECT customs.first_name, customs.last_name, payment.payment_product
FROM customs
INNER JOIN payment ON customs.id=payment.id
;

--4
-- Credit cards of clients for payment

SELECT customs.first_name, customs.last_name, customs.credit_card, payment.payment_product, payment.payment_shipping
FROM customs
INNER JOIN payment ON customs.id=payment.id
INNER JOIN shipping_cost ON shipping_cost.id=payment.id
;

--5
-- Product inspect

SELECT product_inspection.id, customs.the_custom_number, product_inspection.inspect
FROM customs
INNER JOIN product_inspection ON customs.id = product_inspection.id
INNER JOIN product_sending ON product_inspection.id = product_sending.id
INNER JOIN shipping_cost ON product_sending.id = shipping_cost.id
;

--6
-- Damage to the product

SELECT product_inspection.id, customs.the_custom_number, product_inspection.damage_to_the_product
FROM customs
INNER JOIN product_inspection ON customs.id = product_inspection.id
INNER JOIN product_sending ON product_inspection.id = product_sending.id
INNER JOIN shipping_cost ON product_sending.id = shipping_cost.id
;

--7
-- Delivery in

SELECT customs.id, delivery_city.name, delivery_city.name_of_country
FROM customs
INNER JOIN delivery_city ON customs.id=delivery_city.id
;

--8
-- Last number from phone and last number from custom number is percent of discount

SELECT payment.id, customs.phone, customs.the_custom_number
FROM payment
INNER JOIN customs ON payment.id=customs.id
INNER JOIN shipping_cost ON customs.id=shipping_cost.id
;

--9
-- Days for delivery is last number of credit card

SELECT product_sending.id, customs.credit_card
FROM product_sending
INNER JOIN customs ON product_sending.id=customs.id
;

--10
-- Product sending

SELECT product_sending.id, customs.the_custom_number, product_sending.sending
FROM customs
INNER JOIN product_sending ON customs.id = product_sending.id
INNER JOIN payment ON payment.id = product_sending.id
INNER JOIN shipping_cost ON shipping_cost.id = payment.id
;