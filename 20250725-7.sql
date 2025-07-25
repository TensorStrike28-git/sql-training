select count(InvoiceId), count(case when total>=15 then 1 end) as NumHighValueInvoices, count(case when total<5 then 1 end) as NumLowValueInvoices,
coalesce(sum(case when total>=15 then total else 0 end),0)/nullif(count(case when total>=15 then 1 end),0)*1.0 as AvgOfHighValue
from Invoice;