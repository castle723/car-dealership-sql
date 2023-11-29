insert into salesperson (
	salesperson_id,
	first_name,
	last_name
) values (
	1,
	'jacob',
	'dutton'
);
insert into salesperson (
	salesperson_id,
	first_name,
	last_name
) values (
	2,
	'pedro',
	'pascal'
);

insert into car (
	car_id,
	make,
	model,
	color,
	year
) values (
	1,
	'chevy',
	'cruze',
	'white',
	'2018'
);

insert into car (
	car_id,
	make,
	model,
	color,
	year
) values (
	2,
	'chevy',
	'equinox',
	'red',
	'2019'
);

insert into customer (
	customer_id,
	first_name,
	last_name,
	phone_number,
	address,
	email
) values (
	1,
	'ashoka',
	'tano',
	'111-111-1111',
	'home',
	'email.com'
);

insert into customer (
	customer_id,
	first_name,
	last_name,
	phone_number,
	address,
	email
) values (
	2,
	'anakin',
	'skywalker',
	'211-111-1111',
	'home',
	'email.com'
);

insert into invoice (
	invoice_id,
	car_id,
	salesperson_id,
	customer_id,
	date,
	amount
) values (
	1,
	1,
	1,
	1,
	'11/28/2023',
	'$5000'
);

insert into invoice (
	invoice_id,
	car_id,
	salesperson_id,
	customer_id,
	date,
	amount
) values (
	2,
	2,
	1,
	2,
	'11/28/2023',
	'$7000'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name
) values (
	1,
	'henry',
	'cavill'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name
) values (
	2,
	'tom',
	'hanks'
);

insert into "service ticket" (
	service_ticket_id,
	car_id,
	customer_id,
	date_recieved,
	date_returned
) values (
	1,
	1,
	1,
	'11/27/2023',
	'11/27/2023'
);

insert into "service ticket" (
	service_ticket_id,
	car_id,
	customer_id,
	date_recieved,
	date_returned
) values (
	2,
	2,
	2,
	'11/26/2023',
	'11/28/2023'
);

insert into service (
	service_id,
	service_name,
	hourly_rate
) values (
	1,
	'oil change',
	'$40'
);

insert into service (
	service_id,
	service_name,
	hourly_rate
) values (
	2,
	'paint job',
	'$95'
);

insert into "service mechanic" (
	service_mechanic_id,
	service_ticket_id,
	service_id,
	mechanic_id,
	hours,
	rate
) values (
	1,
	1,
	1,
	1,
	'4',
	'$30/hr'
);

insert into "service mechanic" (
	service_mechanic_id,
	service_ticket_id,
	service_id,
	mechanic_id,
	hours,
	rate
) values (
	2,
	2,
	2,
	2,
	'7',
	'$32/hr'
);

insert into "parts" ( 
	part_id,
	part_number,
	description,
	purchase_price
) values (
	1,
	'1244512',
	'oil filter',
	'$30.00'
);

insert into "parts" ( 
	part_id,
	part_number,
	description,
	purchase_price
) values (
	2,
	'83589358',
	'paint canister',
	'$300.00'
);

create or replace function add_partUsed(_parts_used_id integer, _part_id integer, _service_ticket_id integer, _amount_used varchar, _sell_price varchar)
returns void
as $main$
begin
	insert into "parts used" (parts_used_id, part_id, service_ticket_id, amount_used, sell_price)
	values (_parts_used_id, _part_id, _service_ticket_id, _amount_used, _sell_price);
end;
$main$
language plpgsql;

select add_partUsed(1,1,1,'1','$50');

select add_partUsed(2,2,2,'2','$500');


