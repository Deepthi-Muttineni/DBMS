#Assignment-2

#1. Find out the number of documentaries with deleted scenes.

select count(f.film_id) from film f
join film_category fc   
on f.film_id=fc.film_id
join category cat
on fc.category_id=cat.category_id
where cat.name="Documentary" and f.special_features like '%Deleted Scenes%'


#2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens

#r.rental_id,r.customer_id,cat.name,i.store_id,sl.name
select count(r.rental_id) from rental r
join inventory i 
on i.inventory_id=r.inventory_id
join film_category fc 
on fc.film_id=i.film_id
join category cat 
on cat.category_id=fc.category_id 
join staff_list sl 
on sl.id=i.store_id
where cat.name="Sci-Fi" and sl.name="Jon Stephens"




#3. Find out the total sales from Animation movies.

select count(r.rental_id) from rental r
join inventory i 
on i.inventory_id=r.inventory_id
join film_category fc 
on fc.film_id=i.film_id
join category cat 
on cat.category_id=fc.category_id 
join staff_list sl 
on sl.id=i.store_id
where cat.name="Animation"



#4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.

select cu.first_name,cu.last_name, r.rental_id,cat.name, count(cat.name) as rental_count from rental r
join inventory i 
on i.inventory_id=r.inventory_id
join film_category f
on f.film_id=i.film_id
join category cat 
on cat.category_id=f.category_id
join staff_list sl 
on sl.id=i.store_id
join customer cu 
on cu.customer_id=r.customer_id

where cu.first_name="PATRICIA" and cu.last_name="JOHNSON"
group by cat.name
order by rental_count
desc
limit 3



#5. Find out the number of R rated movies rented by “SUSAN WILSON”.

#r.rental_id,cu.first_name,cu.last_name,f.rating
select count(r.rental_id) from rental r
join inventory i 
on i.inventory_id=r.inventory_id
join film f
on f.film_id=i.film_id
join staff_list sl 
on sl.id=i.store_id
join customer cu 
on cu.customer_id=r.customer_id
where f.rating="R" and cu.first_name="SUSAN" and cu.last_name="WILSON"


