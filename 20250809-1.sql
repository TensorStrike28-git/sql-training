select i.BillingCountry , count(i.InvoiceId ) as NumOfInvoices, sum(i.Total ) as TotalAmtSpent, avg(i.Total ) as AvgInvoiceValue
from Invoice i group by i.BillingCountry 
having sum(i.Total ) > 100
order by TotalAmtSpent desc;