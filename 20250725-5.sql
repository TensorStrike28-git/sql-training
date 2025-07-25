select i2.InvoiceId, i2.CustomerId,i2.Total from Invoice i2 where i2.Total > 
(select AvgInvoiceTotal from
(select CustomerId, avg(Total) as AvgInvoiceTotal from Invoice group by CustomerId) as i
where i.CustomerId = i2.CustomerId)
order by i2.Total desc;