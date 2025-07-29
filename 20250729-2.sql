with t1 as (
select i.CustomerId, count(distinct il.TrackId ) as NumberOfTracksPurchased
from Invoice i join InvoiceLine il on i.InvoiceId = il.InvoiceId group by i.CustomerId),
t2 as (
select CustomerId, TrackId as FavoriteTrack from (
select i.CustomerId, il.TrackId, sum(il.quantity), row_number() over (partition by i.CustomerId order by sum(il.quantity) desc) as rnk
from Invoice i join InvoiceLine il on i.InvoiceId = il.InvoiceId group by i.CustomerId, il.TrackId ) where rnk=1),
t3 as (
select c.CustomerId , concat(c.FirstName , ' ' , c.LastName ) as CustomerName, sum(i.Total ) as TotalSpent
from Customer c join Invoice i on c.CustomerId = i.CustomerId group by c.CustomerId , c.FirstName , c.LastName)

select t1.CustomerId, t3.CustomerName, t3.TotalSpent, t1.NumberOfTracksPurchased, t2.FavoriteTrack
from t1 join t2 on t1.CustomerId = t2.CustomerId
join t3 on t1.CustomerId = t3.CustomerId;