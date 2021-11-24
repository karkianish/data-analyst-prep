
-- join
drop table #people
create table #people (id int, first_name varchar(100), last_name varchar(100), salary int);

create table #order (id int, people_id int, total decimal, create_date datetime);

insert into #people(id, first_name, last_name, salary)
values 
(1, 'anish', 'karki', 1000),
(2, 'rashmi', 'karki', 2000),
(3, 'anil', 'panta', 3000),
(4, 'binita', 'panta', 4000)

insert into #order(id, people_id, total, create_date)
values
(100, 1, 100, GETDATE()),
(102, 1, 55, GETDATE()),
(101, 2, 40, getdate()),
(103, 3, 85, getdate())
 



 select * from #people where first_name = 'anish'

 select * from #order;

-- inner join
select *
from #people as p
inner join #order as o on p.id = o.people_id

-- left join 
select *
from #people as p
left join #order as o on p.id = o.people_id
where o.id is null

-- right join
select *
from #people as p
right join #order as o on p.id = o.people_id



-- subquery
select 
* from #people p 
inner join 
(select *
from #people as p
right join #order as o on p.id = o.people_id) o on o.people_id = p.id


select * 
from (select p.*
from #people as p
right join #order as o on p.id = o.people_id) as x


select id,
first_name,
last_name,
(select create_date from #order where id = 100)
from #people;

select * 
from #people p
where exists (select * from #order as o where o.people_id = p.id)


-- cte (common table expression)

with cte_people_and_order as (
	select p.id, p.first_name, p.last_name, o.id as order_id
	from #people p 
	inner join #order o on p.id = o.people_id)
select * from cte_people_and_order
union 
select * from cte_people_and_order;

select @@VERSION
--- 11/24/2021
-- group by, having, where and or, distinct, count, avg, max, min

select sum(max_salary) as total_max_salary 
from (
	select last_name, max(salary) as max_salary
	from #people
	--where first_name != 'rashmi'
	group by last_name) as abc

select * 
from (select *, 
		RANK() over (partition by last_name order by salary desc) as row_num		
		from #people) as x 
where x.row_num = 1



--having max(first_name) = 'rashmi'

select * from #order