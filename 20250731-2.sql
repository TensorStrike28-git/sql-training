select i.BillingCity , count(distinct i.CustomerId ) as UniqueCustomers, count(distinct il.TrackId ) as UniqueTracks,
round(coalesce(count(distinct il.TrackId ),0)/nullif(count(distinct i.CustomerId ),0) * 1.0,2) as AvgDistinctTracksPerCustomer
from Invoice i join InvoiceLine il on i.InvoiceId = il.InvoiceId
group by i.BillingCity 
having count(distinct i.CustomerId ) > 5
order by AvgDistinctTracksPerCustomer desc;