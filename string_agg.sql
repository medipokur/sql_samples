--https://www.mssqltips.com/sqlservertip/5542/using-for-xml-path-and-stringagg-to-denormalize-sql-server-data/

CREATE TABLE #Musteri(MusteriId INT, AdSoyad VARCHAR(50))

INSERT INTO #Musteri
VALUES (1, 'Ali Veli'), (2, 'Ahmet Mehmet')

INSERT INTO #Musteri
VALUES (3, 'Hasan Hüseyin')

CREATE TABLE #MusteriTelefon(MusteriId INT, TelefonNo VARCHAR(20), TelefonTipi VARCHAR(5))

INSERT INTO #MusteriTelefon
VALUES (1, '510 564 4564', 'Ev'), (1, '520 964 4564', 'Cep'), (2, '530 164 4564', 'Ev')

SELECT *
FROM #Musteri

SELECT *
FROM #MusteriTelefon

SELECT	M.MusteriId, 
		M.AdSoyad, 
		STRING_AGG(T.TelefonTipi + ' ' + T.TelefonNo, ', ') AS Telefonlar 
FROM #Musteri M
LEFT JOIN #MusteriTelefon T ON (M.MusteriId = T.MusteriId)
GROUP BY M.MusteriId, M.AdSoyad
ORDER BY M.MusteriId

SELECT 
M.MusteriId,	
  M.AdSoyad,
  Telefonlar = 
  (
    SELECT ', ' + T.TelefonTipi + ' ' + T.TelefonNo
      FROM #MusteriTelefon T
      WHERE T.MusteriId = M.MusteriId
      FOR XML PATH('')
  )
FROM #Musteri M
