create table "salesperson" (
  "salesperson_id" serial,
  "first_name" varchar(100),
  "last_name" varchar(100),
  primary key ("salesperson_id")
);

create table "car" (
  "car_id" serial,
  "make" varchar(100),
  "model" varchar(100),
  "color" varchar(100),
  "year" varchar(100),
  primary key ("car_id")
);

create table "customer" (
  "customer_id" serial,
  "first_name" varchar(100),
  "last_name" varchar(100),
  "phone_number" varchar(100),
  "address" varchar(200),
  "email" varchar(150),
  primary key ("customer_id")
);

create table "invoice" (
  "invoice_id" serial,
  "car_id" integer,
  "salesperson_id" integer,
  "customer_id" integer,
  "date" varchar(50),
  "amount" varchar(50),
  primary key ("invoice_id"),
  constraint "fk_invoice.car_id"
    foreign key ("car_id")
      references "car"("car_id"),
  constraint "fk_invoice.customer_id"
    foreign key ("customer_id")
      references "customer"("customer_id"),
  constraint "fk_invoice.salesperson_id"
    foreign key ("salesperson_id")
      references "salesperson"("salesperson_id")
);

create table "mechanic" (
  "mechanic_id" serial,
  "first_name" varchar(100),
  "last_name" varchar(100),
  primary key ("mechanic_id")
);

create table "service ticket" (
  "service_ticket_id" serial,
  "car_id" integer,
  "customer_id" integer,
  "date_recieved" varchar(100),
  "date_returned" varchar(100),
  primary key ("service_ticket_id"),
  constraint "fk_service ticket.customer_id"
    foreign key ("customer_id")
      references "customer"("customer_id"),
  constraint "fk_service ticket.car_id"
    foreign key ("car_id")
      references "car"("car_id")
);

create table "service" (
  "service_id" serial,
  "service_name" varchar(100),
  "hourly_rate" varchar(100),
  primary key ("service_id")
);

create table "service mechanic" (
  "service_mechanic_id" serial,
  "service_ticket_id" integer,
  "service_id" integer,
  "mechanic_id" integer,
  "hours" varchar(100),
  "rate" varchar(100),
  primary key ("service_mechanic_id"),
  constraint "fk_service mechanic.mechanic_id"
    foreign key ("mechanic_id")
      references "mechanic"("mechanic_id"),
  constraint "fk_service mechanic.service_ticket_id"
    foreign key ("service_ticket_id")
      references "service ticket"("service_ticket_id"),
  constraint "fk_service mechanic.service_id"
    foreign key ("service_id")
      references "service"("service_id")
);

create table "parts" (
  "part_id" serial,
  "part_number" varchar(100),
  "description" varchar(100),
  "purchase_price" varchar(100),
  primary key ("part_id")
);

create table "parts used" (
  "parts_used_id" serial,
  "part_id" integer,
  "service_ticket_id" integer,
  "amount_used" varchar(100),
  "sell_price" varchar(100),
  primary key ("parts_used_id"),
  constraint "fk_parts used.service_ticket_id"
    foreign key ("service_ticket_id")
      references "service ticket"("service_ticket_id"),
  constraint "fk_parts used.part_id"
    foreign key ("part_id")
      references "parts"("part_id")
);

