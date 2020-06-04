-- https://postgres.devmountain.com/
1. --Get all invoices where the unit_price on the invoice_line is greater than $0.99.
select * from invoice i 
join invoice_line il
on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

2. --Get the invoice_date, customer first_name and last_name, and total from all invoices.
select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c
on c.customer_id = i.customer_id;

3. --Get the customer first_name and last_name and the support rep's first_name and last_name from all customers.
select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e
on c.support_rep_id = e.employee_id;

4. --Get the album title and the artist name from all albums.
select al.title, ar.name
from album al
join artist ar
on al.artist_id = ar.artist_id;

5. --Get all playlist_track track_ids where the playlist name is Music.
select pt.track_id 
from playlist_track pt
join playlist pl
on pt.playlist_id = pl.playlist_id
where pl.name = 'Music';

6. --Get all track names for playlist_id 5.
select t.name 
from track t
join playlist_track p
on p.track_id = t.track_id
where p.playlist_id = 5;
 
 7. --Get all track names and the playlist name that they're on ( 2 joins ).
 select t.name, pl.name
from track t
join playlist_track pt on pt.track_id = t.track_id
join playlist pl on t.track_id = pl.playlist_id;

8. --Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
select t.name, a.title
from track t
join album a on t.album_id = a.album_id
join genre g on t.genre_id = g.genre_id
where g.name = 'Alternative & Punk';

BD. --Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name. At least 5 joins.

select t.name, g.name, al.title, ar.name
from track t
join genre g on t.genre_id = g.genre_id
join album al on al.album_id = t.album_id
join artist ar on ar.artist_id = al.artist_id
join playlist_track pt on pt.track_id = t.track_id
join playlist p on p.playlist_id = pt.playlist_id
where p.name = 'Music';


