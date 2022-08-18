select res.Essn , d1.Dnumber, res.num
from DEPARTMENT d1 join (select dep.Essn, count(dep.Dependent_name) as num from DEPENDENT dep
join (select d.Mgr_ssn   from DEPARTMENT d
join (select l.Dnumber, count(l.Dlocation) as num from DEPT_LOCATIONS l
group by l.Dnumber) loc
on loc.Dnumber = d.Dnumber
where loc.num >= 2 ) as n
on dep.Essn = n.Mgr_ssn
group by dep.Essn ) as res
on d1.Mgr_ssn = res.Essn;