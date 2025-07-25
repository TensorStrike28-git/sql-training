select t.TrackId , t.Name , sum(il.Quantity) as TotalSold, sum(il.UnitPrice * il.Quantity) as TotalRevenue
from Track t join InvoiceLine il on t.TrackId = il.TrackId
group by t.TrackId , t.Name
order by TotalRevenue desc
limit 10;