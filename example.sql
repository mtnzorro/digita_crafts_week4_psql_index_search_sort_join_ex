create index on restaurant (name);

create index on reviewer (karma);

create index on review (restaurant_id);

create index on review (reviewer_id);


explain select name from restaurant where restaurant.name = 'Nienow, Kiehn and DuBuque';

explain select name from reviewer order by karma desc limit 10;

explain select review.content, restaurant.name from review inner join restaurant on review.restaurant_id = restaurant.id where restaurant.name = 'Nienow, Kiehn and DuBuque';

explain select
	name, avg_stars
from
(select
	avg(review.stars) as avg_stars, restaurant.name
from
	review
inner join
	restaurant on review.restaurant_id = restaurant.id
group by
	restaurant.name) as avg_star_per_restaurant
where
	name = 'Nienow, Kiehn and DuBuque'
;

explain select
avg(karma)
from
(select reviewer.name, reviewer.karma as karma, restaurant.name from reviewer inner join review on review.reviewer_id = reviewer.id inner join restaurant on review.restaurant_id = restaurant.id where restaurant.name = 'Nienow, Kiehn and DuBuque') as reviewers_given_rest
;

select reviewer.name, reviewer.karma as karma, restaurant.name from reviewer inner join review on review.reviewer_id = reviewer.id inner join restaurant on review.restaurant_id = restaurant.id where restaurant.name = 'Nienow, Kiehn and DuBuque';
