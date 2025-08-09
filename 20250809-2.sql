select c.CustomerId , concat(c.FirstName , ' ', c.LastName ) as CustomerName, count(distinct il.TrackId ) as DistinctTracks,
sum(il.UnitPrice * il.Quantity  ) as RevenueFromCustomer
from Customer c join Invoice i on c.CustomerId = i.CustomerId 
join InvoiceLine il on i.InvoiceId = il.InvoiceId
group by c.CustomerId , c.FirstName , c.LastName 
HAVING count(distinct il.TrackId )>20
order by RevenueFromCustomer desc;