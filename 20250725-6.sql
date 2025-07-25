select i2.InvoiceId, i2.CustomerId,i2.Total from Invoice i2 where i2.Total > 
(select avg(i.Total) from Invoice i where i.CustomerId = i2.CustomerId
)
order by i2.Total desc;