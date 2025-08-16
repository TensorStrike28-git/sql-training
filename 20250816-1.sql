with t0 as (
select strftime('%Y%m', i.InvoiceDate) as YearMonth,
sum(i.Total ) as TotalRevenue
from Invoice i
group by strftime('%Y%m' ,i.InvoiceDate)
), t1 as (
select YearMonth, TotalRevenue,
lag(TotalRevenue) over (order by YearMonth asc) as PrevMonthRevenue
from t0
)

select YearMonth, TotalRevenue,
coalesce(TotalRevenue-PrevMonthRevenue,0)/nullif(PrevMonthRevenue,0) * 100.0 as MoM_GrowthPct
from t1
order by YearMonth asc;
