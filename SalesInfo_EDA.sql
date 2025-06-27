select * from sales_info;


-- Explore Cancellation Reasons
select Cancellation_Reason, count(Cancellation_Reason) as total
from sales_info
group by Cancellation_Reason;

--  Track Cancellations Over Time
select date_format(Cancellation_Date, '%y-%m') as cancellation_date, count(Cancellation_Date) as total_cancellation
from sales_info
group by date_format(Cancellation_Date, '%y-%m')
order by date_format(Cancellation_Date, '%y-%m');

-- Track Cancellations Over Time
select count(distinct Purchase_Location) as total_location
from sales_info;	

-- Analyze Contract Status
select Contract_Status, count(Contract_Status) as total_Contract_Status
from sales_info
group by Contract_Status;


-- finding null
select
sum(case when Contract_Status is null then 1 else 0 end) as null_contract_status,
sum(case when Cancellation_Date is null then 1 else 0 end) as null_Cancellation_Date,
sum(case when Cancellation_Reason is null then 1 else 0 end) as null_Cancellation_Reason
from sales_info;

-- total rows
select count(*) as count_rows
from sales_info;

-- YOY 
with summary1 as
(
select date_format(Sale_Dt, '%Y') as date_purchase, Customer_Type, sum(Points_Purchase) as P_Purchase
from sales_info 
group by date_purchase, Customer_Type
), summary2 as
(
select *, lag(P_Purchase) over(partition by Customer_Type order by date_purchase asc) as yoy
from summary1
) select * from summary2;

--
select Purchase_Location, sum(Points_Purchase) as Points_purchase
from sales_info
group by Purchase_Location
order by Points_Purchase desc;


select Cancellation_Reason, count(Contract_Num) as Total_Contract
from sales_info
group by Cancellation_Reason;

select date_format(cancellation_Date, '%y-%m') as date_cancel, count(Contract_Num) as Total_Contract
from sales_info
group by date_cancel;

select contract_status, Customer_Type, sum(Points_Purchase) as purchased_points
from sales_info
group by contract_status, Customer_Type
order by purchased_points desc;

select contract_status, Customer_Type, Cancellation_Reason
from sales_info
order by Cancellation_Reason asc;



