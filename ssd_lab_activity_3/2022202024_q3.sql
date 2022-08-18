select s.Mgr_ssn ,count(w.Pno) as noOfProject from WORKS_ON w 
join (select d.Mgr_ssn from DEPARTMENT d 
join (select p1.Dnum from PROJECT p1
where p1.Pname = "ProductY") p
on p.Dnum = d.Dnumber) s
on s.Mgr_ssn = w.Essn
where w.Essn IS NOT null
group by w.Essn; 