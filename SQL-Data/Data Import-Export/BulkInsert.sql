BULK INSERT ExcelImportTraining.dbo.Products2
	FROM 'C:\Demo\Products.csv'
	WITH
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)