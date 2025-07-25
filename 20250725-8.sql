select CustomerId , InvoiceId , Total , rank() over (partition by CustomerId  order by Total desc) as RankInCustomer
from Invoice
order by CustomerId , RankInCustomer