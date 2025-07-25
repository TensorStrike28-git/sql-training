select CustomerId , FirstName , LastName from Customer c where exists
(select 1 from Invoice i where c.CustomerId = i.CustomerId)
order by CustomerId asc;