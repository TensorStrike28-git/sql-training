with t0 as (
select i.BillingCountry , c.CustomerId , concat(c.FirstName , ' ', c.LastName ) as CustomerName, 
sum(i.Total ) as TotalSpent, rank() over(partition by i.BillingCountry order by sum(i.Total ) desc) as rnk
from Customer c join Invoice i on c.CustomerId = i.CustomerId
group by i.BillingCountry , c.CustomerId , c.FirstName , c.LastName 
)

select BillingCountry, CustomerId, CustomerName, TotalSpent from t0 where rnk <=2
order by BillingCountry , TotalSpent desc;