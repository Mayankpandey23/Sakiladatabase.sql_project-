#create databse 
create database sakila;
use sakila;

select * from `sakila.address`;
select count(*) from `sakila.address`;

select address from `sakila.address` limit 10;
select count(*) as total_addresses from `sakila.address`;

#where
select * from `sakila.address` where district = "alberta" ;
select * from `sakila.address` where district = "california";

SELECT address_id, district, city_id
FROM `sakila.address`
WHERE city_id > 300;

#MULTIPLE CONDITION (AND /OR)
SELECT *
FROM `sakila.address`
WHERE district = 'Texas'
AND city_id < 400;


#groupby + count 
select district, count(*) as total_address from `sakila.address`
 group by district 
 order by total_address Desc ;
 
 #null check 
 select * from `sakila.address` where postal_code is NULL ;
 
 #PATTERN SEARCH (LIKE)
 SELECT *
FROM `sakila.address`
WHERE phone LIKE '140%';

#Having clause 
SELECT district, COUNT(*) AS total_address
FROM `sakila.address`
GROUP BY district
HAVING COUNT(*) > 5;

SELECT city_id, COUNT(*) AS total
FROM `sakila.address`
GROUP BY city_id
HAVING total >= 3;
 
 #order by 
 select * from `sakila.address` order by last_update DESC ;
 
 #limit 
 select * from `sakila.address` limit 10 ;
 
 SELECT *
FROM `sakila.address`
ORDER BY last_update DESC
LIMIT 5;
 
 #JOIN
 #comparing the same district addresses
 SELECT a.address_id, a.district, b.address_id
FROM `sakila.address` a
JOIN `sakila.address` b
ON a.district = b.district
AND a.address_id <> b.address_id;

# Record of same city_id 
SELECT a.address, b.address, a.city_id
FROM `sakila.address` a
JOIN `sakila.address` b
ON a.city_id = b.city_id
AND a.address_id < b.address_id;

#subquery 
SELECT district, COUNT(*) AS total
FROM `sakila.address`
GROUP BY district
HAVING total = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM `sakila.address`
        GROUP BY district
    ) AS temp
);
 
 #Duplicate 
 SELECT district, COUNT(*)
FROM `sakila.address`
GROUP BY district
HAVING COUNT(*) > 1;
 
 

