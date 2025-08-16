with t0 as (
select g.Name as GenreName, t.TrackId , t.Name as TrackName,
sum(il.Quantity * il.UnitPrice) as Revenue
from InvoiceLine il join Track t on il.TrackId = t.TrackId join
Genre g on g.GenreId = t.GenreId
group by g.Name , t.Name , t.TrackId),
t1 as (
select *,
rank() over (partition by GenreName order by Revenue desc) as rnk
from t0
)

select Genrename, TrackId, TrackName, Revenue
from t1 where rnk<=3
order by GenreName asc , Revenue desc
