-- Insert code to create Database Schema
-- This will create your .db database file for use
drop table if exists customers;
create table customers(
	customer_id integer primary key,
	first_name text not null,
	last_name text not null,
	email text not null,
	phone integer not null,
	company text not null
);

drop table if exists address;
create table address(
	id integer primary key,
	street_address text not null,
	city text not null,
	state text not null,
	country text not null,
	zipcode integer not null, 
	customer_id integer not null, 
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

drop table if exists orders;
create table orders(
	order_id integer primary key,
	name_of_part text not null,
	manufacturer_of_part text not null,
	customer_id integer not null, 
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

drop table if exists customers_orders;
create table customers_orders(
	id integer primary key,
	customer_id integer not null, 
	order_id integer not null, 
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

-- right now there isn't really any point to having a many to many sql table customers_orders
-- shouldn't this be generated dynamically from orders and customers