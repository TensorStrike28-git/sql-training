
with t1 as
(select c.CustomerId , concat(c.FirstName , ' ', c.LastName ) as CustomerName, i.InvoiceId , i.InvoiceDate, i.Total as InvoiceTotal,
sum(i.Total ) over (partition by c.CustomerId order by i.InvoiceDate asc) as RunningTotal, 
avg(i.Total ) over (partition by c.CustomerId) as CustomerAvg
from Customer c join Invoice i on c.CustomerId = i.CustomerId)

SELECT CustomerId, CustomerName, InvoiceId, InvoiceDate, InvoiceTotal, RunningTotal, 
(case when InvoiceTotal > CustomerAvg then 'Yes' else 'No' end ) as AboveAverageInvoice
from t1 order by CustomerId, InvoiceDate ;