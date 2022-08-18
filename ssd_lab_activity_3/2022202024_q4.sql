
select dep.Dname, dep.Dnumber, count(l.Dlocation) as num from DEPT_LOCATIONS l
join ( select d.Dname, d.Dnumber from DEPARTMENT d
join (select dp.Essn, count(dp.Dependent_name) as num
from DEPENDENT as dp
where dp.Sex = "F"
group by dp.Essn) fc
on fc.Essn = d.Mgr_ssn
where fc.num >= 2) dep
on dep.Dnumber = l.Dnumber
group by l.Dnumber;