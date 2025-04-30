select YEAR(PaymentDate) as yil, count(1) as kayit
into #tmp
from dbo.SomeTable
group by YEAR(PaymentDate)

SELECT *, sum(kayit) over (order by yil) Kumule_Toplam
from #tmp
--where yil >= 2025
order by yil

---- same with cte
;with cte_kayit (yil, kayit_sayisi) as
(
select YEAR(PaymentDate) as yil, count(1) as kayit
from dbo.SomeTable
group by YEAR(PaymentDate)
)


SELECT *, sum(kayit_sayisi) over (order by yil) Kumule_Toplam
from cte_kayit
--where yil >= 2025
order by yil
