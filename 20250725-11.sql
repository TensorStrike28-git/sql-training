select InvoiceId , CustomerId , InvoiceDate , Total , 
sum(Total) over(partition by CustomerId order by InvoiceDate rows between 2 preceding and current row) as Rolling3Sum
from Invoice