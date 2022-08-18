-- select * from DEPARTMENT;
-- select * from EMPLOYEE;
-- select * from WORKS_ON;

 
select concat(E.Fname," ", E.Minit," ", E.Lname) as Fullname,dep.Mgr_ssn, dep.Dnumber, dep.Dname from EMPLOYEE E 
join (select distinct D.Mgr_ssn, D.Dname, D.Dnumber from DEPARTMENT D join 
 (select P.Dnum from PROJECT P 
join WORKS_ON w
on P.Pnumber = w.Pno
where w.Hours < 40 ) n
on n.Dnum = D.Dnumber) dep 
on dep.Mgr_ssn = E.Ssn;





