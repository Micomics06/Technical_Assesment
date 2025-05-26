select * from sales_info;

select date_format(Sale_Dt, '%y-%m') as date_purchase, Customer_Type, Points_Purchase, 
lag(Points_Purchase) over(partition by date_format(Sale_Dt, '%y-%m') order by Customer_Type desc) as yoy
from sales_info 
group by date_purchase,Customer_Type, Points_Purchase;

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



