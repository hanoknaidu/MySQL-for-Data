# US Household Income Data Cleaning

select* 
From US_Household_Income.us_household_income;

select*
from US_Household_Income.us_household_income_statistics;

select count(id)
from US_Household_Income.us_household_income;

select count(id)
from US_Household_Income.us_household_income_statistics;


select id,count(id)
from US_Household_Income.us_household_income
group by id
having count(id) > 1;

select * from(
select row_id,
id,
row_number() over(partition by id order by id) row_num
from US_Household_Income.us_household_income) duplicates
where row_num>1
;


SET SQL_SAFE_UPDATES = 0;

delete from US_Household_Income 
where row_id in(
select row_id
from(
select row_id,
id,
row_number() over(partition by id order by id) row_num
from US_Household_Income.us_household_income) duplicates
where row_num>1)
;


select id,count(id)
from US_Household_Income.us_household_income_statistics
group by id
having count(id) > 1;


select state_name,count(state_name)
from US_Household_Income.us_household_income
group by state_name;


select distinct state_name
from US_Household_Income.us_household_income
order by 1;


update US_Household_Income.us_household_income
set state_name = 'Georgia'
where state_name = 'georia'
;

update US_Household_Income.us_household_income
set state_name ='Alabama'
where state_name = 'alabama';

select distinct state_ab
from US_Household_Income.us_household_income
order by 1;


select *
from US_Household_Income.us_household_income
where place = ''
order by 1;

select *
from US_Household_Income.us_household_income
where county ='Autauga County'
order by 1;


update US_Household_Income
set place = 'Autaugaville'
where county = 'Autauga County'
and city ='vinemont';

select place
from US_Household_Income.us_household_income
;

select* 
From US_Household_Income.us_household_income;


select type,count(type)
from US_Household_Income.us_household_income
group by type
order by 1;


update US_Household_Income
set type ='Borough'
where type= 'bororughs';


select ALand,AWater
from US_Household_Income.us_household_income
where (AWater=0 or AWater = '' or AWater is null)
and (ALand=0 or ALand = '' or ALand is null);

select ALand,AWater
from US_Household_Income.us_household_income
where (ALand=0 or ALand = '' or ALand is null);

# US Household Income Exploratory Data Analysis
select* 
From US_Household_Income.us_household_income;

select*
from US_Household_Income.us_household_income_statistics;

select state_name,SUM(ALand),sum(Awater)
From US_Household_Income.us_household_income
group by state_name
order by 3 desc
limit 10;

select u.state_name,County,Type,`Primary`,Mean,Median
From US_Household_Income.us_household_income u
inner join US_Household_Income.us_household_income_statistics us
on u.id=us.id
where mean <> 0;


select u.state_name,round(avg(Mean),1),round(avg(Median),1)
From US_Household_Income.us_household_income u
inner join US_Household_Income.us_household_income_statistics us
on u.id=us.id
where mean <> 0
group by u.state_name
order by 3 desc 
limit 10;

select type,round(avg(Mean),1),round(avg(Median),1)
From US_Household_Income.us_household_income u
inner join US_Household_Income.us_household_income_statistics us
on u.id=us.id
where mean <> 0
group by type
order by 2 desc 
limit 20;

select type,count(type),round(avg(Mean),1),round(avg(Median),1)
From US_Household_Income.us_household_income u
inner join US_Household_Income.us_household_income_statistics us
on u.id=us.id
where mean <> 0
group by type
order by 4 desc 
limit 20;


select * 
from us_household_income
where type = 'community';


select type,round(avg(Mean),1),round(avg(Median),1)
From US_Household_Income.us_household_income u
inner join US_Household_Income.us_household_income_statistics us
on u.id=us.id
where mean <> 0
group by type
having count(type) > 100
order by 2 desc 
limit 20;


select u.state_name,City,round(avg(mean),1),round(avg(median),1)
From US_Household_Income.us_household_income u
inner join US_Household_Income.us_household_income_statistics us
on u.id=us.id
group by u.state_name,city
order by round(avg(mean),1) desc;
