with t0 as (SELECT 2*SUM(Total)/count(distinct CustomerId) * 1.0 as Benchmark from Invoice i ),
t1 as (
select c.CustomerId , concat(c.FirstName , ' ', c.LastName ) as CustomerName, count(i.InvoiceId ) as TotalInvoices, g.Name,
sum(i.Total ) as TotalSpent, case when sum(i.Total) > (select Benchmark from t0) then 'Yes' else 'No' end as HighSpenderFlag,
rank() over(partition by c.CustomerId order by sum(il.Quantity ) desc) as rnk
from Customer c join Invoice i on c.CustomerId = i.CustomerId 
join InvoiceLine il on i.InvoiceId = il.InvoiceId 
join Track t on il.TrackId = t.TrackId
join Genre g on t.GenreId = g.GenreId
group by c.CustomerId , c.FirstName , c.LastName , g.Name 
)

select CustomerId, CustomerName, TotalInvoices, TotalSpent, Name as MostPurchasedGenre, HighSpenderFlag
from t1 where rnk=1
order by TotalSpent desc;