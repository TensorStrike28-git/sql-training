select i.BillingCountry , count(i.InvoiceId ) TotalInvoices, sum(i.Total ) TotalAmount, 
count(case when g.Name = 'Rock' then 1 end ) as RockTrackCount,
round(coalesce(count (distinct case when g.Name = 'Rock' then t.TrackId  end ),0)/nullif(count(i.InvoiceId ),0) * 1.0,10) as RockPurchaseRate
from Invoice i join InvoiceLine il on i.InvoiceId = il.InvoiceId
join Track t on il.TrackId = t.TrackId
join Genre g on t.GenreId = g.GenreId
group by i.BillingCountry
having TotalInvoices > 10
order by RockPurchaseRate desc