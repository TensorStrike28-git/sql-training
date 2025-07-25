with t1 as (
select *, 300*abs(RANDOM()%(30-5)+5)+EmployeeId*100 as Incentive
from Employee
)

select e.EmployeeId, concat(e.FirstName, e.LastName) as EmployeeName, m.EmployeeId as ManagerId, concat(m.FirstName, m.lastName) as ManagerName,
e.Incentive as EmployeeIncentive, m.Incentive as ManagerIncentive
from t1 e left join t1 m
on e.ReportsTo = m.EmployeeId
where e.Incentive > coalesce(m.Incentive,0)
order by e.Incentive desc;
