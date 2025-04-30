create table #tmp (ObjectType varchar(50), SchemaName varchar(10), ObjectName varchar(200)) 
insert into #tmp
exec dbo.some_sp 'sp_param'
