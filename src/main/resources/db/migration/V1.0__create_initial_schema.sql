drop table if exists customer;
drop table if exists hibernate_sequence;
drop table if exists location;
drop table if exists order_detail;
drop table if exists orders;
drop table if exists orders_location;
drop table if exists product;
drop table if exists product_category;
drop table if exists stock;
drop table if exists supplier;
create table customer (
  id         integer not null AUTO_INCREMENT,
  first_name varchar(255),
  last_name  varchar(255),
  username   varchar(255),
  primary key (id)
);
create table hibernate_sequence (
  next_val bigint
);
create table location (
  id      integer not null,
  city    varchar(255),
  country varchar(255),
  county  varchar(255),
  street  varchar(255),
  name    varchar(255),
  primary key (id)
);

create table order_detail (
  id         integer not null AUTO_INCREMENT,
  quantity   integer,
  order_id   integer,
  product_id integer,
  primary key (id)
);
create table orders (
  id          integer not null AUTO_INCREMENT,
  city        varchar(255),
  country     varchar(255),
  county      varchar(255),
  street      varchar(255),
  customer_id integer,
  primary key (id)
);
create table orders_location (
  location_id integer not null,
  order_id    integer not null
);
create table product (
  id          integer not null AUTO_INCREMENT,
  description varchar(255),
  name        varchar(255),
  price       decimal(19, 2),
  weight      double precision,
  category_id integer,
  supplier_id integer,
  primary key (id)
);
create table product_category (
  id          integer not null AUTO_INCREMENT,
  description varchar(255),
  name        varchar(255),
  primary key (id)
);
create table stock (
  id          integer not null AUTO_INCREMENT,
  quantity    integer,
  location_id integer,
  product_id  integer,
  primary key (id)
);
create table supplier (
  id   integer not null AUTO_INCREMENT,
  name varchar(255),
  primary key (id)
);
alter table order_detail
  add constraint FK_orders_order_detail foreign key (order_id) references orders (id);
alter table order_detail
  add constraint FK_product_order_detail foreign key (product_id) references product (id);
alter table orders
  add constraint FK_customer_orders foreign key (customer_id) references customer (id);
alter table orders_location
  add constraint FK_orders_orders_location foreign key (order_id) references orders (id);
alter table orders_location
  add constraint FK_location_orders_location foreign key (location_id) references location (id);
alter table product
  add constraint FK_product_category_product foreign key (category_id) references product_category (id);
alter table product
  add constraint FK_supplier_product foreign key (supplier_id) references supplier (id);
alter table stock
  add constraint FK_location_stock foreign key (location_id) references location (id);
alter table stock
  add constraint FK_product_stock foreign key (product_id) references product (id);

