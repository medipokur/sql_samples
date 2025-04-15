create table #tmp_sales (PurchaseDate DATE, PurchaseCount INT)

INSERT INTO #tmp_sales 
VALUES ('2020-10-01', 50), ('2020-11-05', 70), ('2021-03-03', 100), ('2021-03-15', 130), ('2021-04-13', 60),
('2022-01-06', 100), ('2022-02-12', 50)

;with data as (
select YEAR(PurchaseDate) as yil, sum(PurchaseCount) as kayit
from #tmp_sales
group by YEAR(PurchaseDate))

SELECT *, sum(kayit) over (order by yil) Kumule_Toplam
from data
--where yil <= 2021
order by yil
