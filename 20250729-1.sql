SELECT c.CustomerId, concat(c.FirstName , c.LastName ) as CustomerName, count(i.InvoiceId ) as TotalInvoices, sum(i.Total ) as TotalAmount,
count(case when i.Total>=15 then 1 end) as HighValueCount, count(case when i.Total<5 then 1 end) as LowValueCount 
from Customer c join Invoice i
on c.CustomerId = i.CustomerId
group by c.CustomerId , c.FirstName , c.LastName 
order by sum(i.Total ) desc;