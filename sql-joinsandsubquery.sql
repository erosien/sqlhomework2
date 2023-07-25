-- 1 
select first_name,last_name,email,district
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas';

-- 2
select first_name,last_name,amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3
select first_name,last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

-- 4
select first_name,last_name,country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- 5
select staff.staff_id, staff.first_name, staff.last_name, count(payment_id)
from staff
inner join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id, staff.first_name, staff.last_name
order by count(payment_id) desc;

-- 6
select rating, count(distinct title)
from film
group by rating 
order by count(distinct title) desc;

-- 7
select first_name,last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id, amount
	having amount > 6.99
	order by amount desc
);

-- 8
select store.store_id, count(rental.rental_id)
from store
full join inventory
on store.store_id = inventory.store_id
full join rental
on inventory.inventory_id = rental.inventory_id
full join payment
on rental.rental_id = payment.rental_id
where amount = 0.00
group by store.store_id
order by count(rental.rental_id) desc;