create table #tmpHareket (
	Tarih DATE,
	Ledger INT,
	Debit MONEY,
	Credit MONEY
	)

insert into #tmpHareket Values
('2019-09-20', 380005, 0, 100),
('2019-09-20', 380005, 50, 0),
('2019-09-21', 380005, 50, 0),
('2019-09-20', 380006, 50, 0),
('2019-09-22', 380005, 0, 200)


SELECT DISTINCT Tarih, Ledger,
SUM(Debit) OVER (PARTITION BY Tarih, Ledger) AS DailyDebit,
SUM(Credit) OVER (PARTITION BY Tarih, Ledger) AS DailyCredit,
SUM(Debit) OVER (PARTITION BY Ledger ORDER BY Tarih) AS TotalDebit,
SUM(Credit) OVER (PARTITION BY Ledger ORDER BY Tarih) AS TotalCredit
FROM #tmpHareket
ORDER BY Ledger