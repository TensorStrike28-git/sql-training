select count(i.InvoiceId ) as TotalInvoices, count(case when i.Total >=15 then 1 end) as HighValueCount,
count(case when i.Total <5 then 1 end) as LowValueCount,
coalesce(sum(case when i.Total >=15 then i.Total else 0 end),0)/nullif(count(case when i.Total >=15 then 1 end),0)*1.0 as AvgHighValueTotal
from Invoice i 