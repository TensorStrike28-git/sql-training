SELECT i.BillingCountry , count(distinct il.TrackId ) as DistinctTracks,
count(il.InvoiceLineId ) as TotalPurchases,
round(count(il.InvoiceLineId )/nullif(count(distinct il.TrackId ) *1.0,2),0) as RepeatRate
from Invoice i join InvoiceLine il on i.InvoiceId = il.InvoiceId
group by i.BillingCountry
having count(il.InvoiceLineId )>=50
order by RepeatRate desc;