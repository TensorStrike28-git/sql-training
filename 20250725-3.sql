select i.CustomerId , c.FirstName ,c.LastName , count(i.InvoiceId ) as TotalInvoices
from Invoice i join Customer c on i.CustomerId = c.CustomerId 
group by i.CustomerId ,	c.FirstName , c.LastName
order by TotalInvoices DESC ;