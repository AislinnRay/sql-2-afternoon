--https://postgres.devmountain.com/
1. --Find all customers with fax numbers and set those numbers to null.
update customer
set fax = null
where fax is not null;

2. --Find all customers with no company (null) and set their company to "Self".
update customer
set company = 'Self'
where company is null;

3. --Find the customer Julia Barnett and change her last name to Thompson.
update customer
set last_name = 'Thompson'
where first_name is 'Julia' 
AND last_name is 'Barnett';

4. --Find the customer with this email luisrojas@yahoo.cl and change his support rep to 4.
update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

5. --Find all tracks that are the genre Metal and have no composer. Set the composer to "The darkness around us".
update track
set composer = 'The darkness around us'
where genre_id = 
(select genre_id from genre where name = 'Metal') 
AND composer is null;

6. -- Refresh your page to remove all database changes.