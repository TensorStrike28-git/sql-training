
select CustomerId , InvoiceId , InvoiceDate , Total, NextInvoiceDate,
cast(JULIANDAY(NextInvoiceDate)-JULIANDAY(InvoiceDate) as integer) as GapInDays
from (select  * , lead(InvoiceDate) over(partition by CustomerId order by InvoiceDate) as NextInvoiceDate from Invoice) as t1
order by CustomerId , InvoiceDate;