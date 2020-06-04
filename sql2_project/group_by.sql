--https://postgres.devmountain.com/
1. -- Find a count of how many tracks there are per genre. Display the genre name with the count.
select count(*), g.name
from track t
join genre g on t.genre_id = g.genre_id
group by g.name;

2. --Find a count of how many tracks are the "Pop" genre and how many tracks are the "Rock" genre.
select count(*), g.name
from track t
join genre g on t.genre_id = g.genre_id
where g.name = 'Pop' OR g.name ='Rock'
group by g.name;

3. --Find a list of all artists and how many albums they have.
select a.name, count(*)
from artist a
join album al on a.artist_id = al.artist_id
group by a.name;