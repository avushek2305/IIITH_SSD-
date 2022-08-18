select temp.fullname, temp.num, temp.Ssn, D.Dname, D.Dnumber from DEPARTMENT D
join (select concat(Fname, " ", Minit, " ", Lname) as fullname ,E.Ssn, sup.num  from EMPLOYEE E
join (select Super_ssn, count(Ssn) as num from EMPLOYEE E1
WHERE E1.Super_ssn IS NOT NULL
group by E1.Super_ssn 
order by num) sup
on sup.Super_ssn = E.Ssn) temp
on temp.Ssn = D.Mgr_ssn;
 