create database customer_service



--use customer_service

select * from [customer_feedback_satisfaction ]

--min AGE 
--MAX AGE 
--avg AGE


select min(Age) from [customer_feedback_satisfaction ]
select max(Age) from [customer_feedback_satisfaction ]
select AVG(Age) from [customer_feedback_satisfaction ]







--create a new column  as age_level nvarchar(250) and make a cases for the age due to the income 

alter table [customer_feedback_satisfaction] add  age_level nvarchar(250)

update [customer_feedback_satisfaction]
set age_level =case 
when Age between 18 and 25 then 'young (18-25)'
when Age between 25 and 40 then 'mature (25-40)'
else 'mid_life(40-69)'
end 
select * from [customer_feedback_satisfaction]




---show the the avg of income due to the stages of age_level 

select AVG(Income) as average_income , age_level from  [customer_feedback_satisfaction]
group by age_level
order by average_Income desc

select max(Age) FROM [customer_feedback_satisfaction]



-----add column due to the table is service_quality_averge 



alter table [customer_feedback_satisfaction] add service_quality_level nvarchar(250)

update [customer_feedback_satisfaction]
set service_quality_level=
case 
	when 	[ServiceQuality] between 1 and 3 then 'bad'
	when   [ServiceQuality]  between 3 and 6 then 'good'
	else 'excellent'
	end 
	select * from [customer_feedback_satisfaction]

	select count (service_quality_level) as service_quailty  , country,service_quality_level from [customer_feedback_satisfaction]
	where service_quality_level  in('excellent','good','bad')
	group by country,service_quality_level
	order by service_quailty desc 

	--sum income due to the country 
		select sum(Income) AS Sum_income,country from [customer_feedback_satisfaction]
		group by country 
		order by Sum_income desc

	--max income due to the country
		select max(Income) AS Sum_income,country from [customer_feedback_satisfaction]
		group by country 
		order by Sum_income desc





	--create column as product_quality_level
	alter table [customer_feedback_satisfaction] add product_quality_level nvarchar(250)
	 update [customer_feedback_satisfaction]
	 set product_quality_level = 
	 case 
	 when [ProductQuality] between 1 and 3 then 'bad'
	 when [ProductQuality] between  3 and 6 then 'good'
	 else 'excellent'
	 end 
	 select * from [customer_feedback_satisfaction]

	 select count([ProductQuality]) as count_product,country,product_quality_level 
	 from [customer_feedback_satisfaction]
	 where product_quality_level in ('excellent','good','bad')
		group by country,product_quality_level
	order by count_product desc 

	--count of customer_id

	select count([CustomerID]) AS COUNT_CUSTOMER_ID,[Country], Age from [customer_feedback_satisfaction]
		group by [Country] ,Age
		order by COUNT_CUSTOMER_ID DESC,Age 


			select count(Gender) from [customer_feedback_satisfaction]
			where Gender='Female'

				SELECT 
   
    SatisfactionScore / 10 AS SatisfactionScore_Decimal

from [customer_feedback_satisfaction ]    
