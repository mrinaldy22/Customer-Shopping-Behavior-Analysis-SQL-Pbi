


select count(*) as null_count
from shopping_behavior
where Customer_ID is null or Purchase_Amount_USD is null;


select *
from shopping_behavior
where
Customer_ID is null
or Age is null
or Category is null
or Purchase_Amount_USD is null
or Gender is null;


select *
from shopping_behavior
where 
age < 0 or age > 100
or Purchase_Amount_USD <= 0
or Review_Rating < 0 or Review_Rating > 5;

alter table shopping_behavior
add Generations varchar(20);

update shopping_behavior
set Generations = case
WHEN Age BETWEEN 61 AND 79 THEN 'Gen Boomers'
WHEN Age BETWEEN 45 AND 60 THEN 'Gen X'
WHEN Age BETWEEN 29 AND 44 THEN 'Gen Millenial'
WHEN Age BETWEEN 13 AND 28 THEN 'Gen Z'
WHEN Age BETWEEN 0 AND 12 THEN 'Gen Alpha'
else 'Others'
end;


SELECT 
    Generations,
    SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) AS DoubleApplied,
    SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'No'  THEN 1 ELSE 0 END) AS DiscountOnly,
    SUM(CASE WHEN Discount_Applied = 'No'  AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) AS VoucherOnly,
    SUM(CASE WHEN Discount_Applied = 'No'  AND Promo_Code_Used = 'No'  THEN 1 ELSE 0 END) AS NotApplied,
    COUNT(*) AS Jumlah,
    CAST(SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Persentase
FROM shopping_behavior
GROUP BY Generations
ORDER BY Persentase Desc;


SELECT 
    Category,
    SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) AS DoubleApplied,
    SUM(CASE WHEN Discount_Applied = 'No'  AND Promo_Code_Used = 'No'  THEN 1 ELSE 0 END) AS NotApplied,
    COUNT(*) AS Jumlah,
    CAST(SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Persentase
FROM shopping_behavior
GROUP BY Category
ORDER BY Persentase desc;

select 
generations, 
avg(purchase_amount_USD) as AvgSpending
from shopping_behavior
group by generations
order by AvgSpending desc

SELECT 
    Gender,
    SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) AS DoubleApplied,
    COUNT(*) AS Jumlah,
    CAST(SUM(CASE WHEN Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Persentase
FROM shopping_behavior
GROUP BY Gender
ORDER BY Persentase desc;


select 
Payment_Method, Generations,
count(*) as jumlah,
avg(purchase_amount_USD) as AvgSpending
from shopping_behavior
where Discount_Applied = 'Yes' AND Promo_Code_Used = 'Yes' 
group by Payment_Method, Generations
order by AvgSpending desc;

select 
Gender,
count(*) as jumlah,
sum(purchase_amount_USD) as TotalSpending
from shopping_behavior
group by Gender
order by TotalSpending desc





