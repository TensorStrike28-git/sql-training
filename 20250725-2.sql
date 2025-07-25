SELECT t.GenreId, g.Name, count(t.TrackId) as NumberOfTracks, avg(t.UnitPrice) as AvgUnitPrice from
Track t join Genre g on t.GenreId = g.GenreId 
group by t.GenreId, g.Name 
having count(t.TrackId) > 15
order by AvgUnitPrice desc;