/*
===============================================================================
Stored Procedure: bronze.load_bronze
Description:      Loads raw data from CRM and ERP CSV files into Bronze tables.
Parameters:       None (no input or output parameters).
Return Value:     No explicitly defined return value.
Operations:       Truncates existing table data and bulk loads CSV files using
                  BULK INSERT.
Processing:       Loads six tables sequentially and measures the duration of
                  each load and the entire batch.
Error Handling:   Uses TRY...CATCH to capture and display error information.
Execution:        Must be executed separately using EXEC bronze.load_bronze;
===============================================================================
*/
--Scripts to load data from CRMs (BULK LOAD)
--Stored Procedure

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	
	BEGIN TRY
		SET @batch_start_time = GETDATE()
		--CRM
		--Insert cust_info

		PRINT('===============================')
		PRINT('Loading Bronze Layer')
		PRINT('===============================')

		PRINT('-------------------------------')
		PRINT('Loading CRM Tables')
		PRINT('-------------------------------')

		SET @start_time = GETDATE()
		PRINT('Truncating Table: bronze.crm_cust_info')
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT('Inserting Data Into: bronze.crm_cust_info')
		BULK INSERT bronze.crm_cust_info 
		FROM "D:\SQL Course\Projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv"
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT('>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds')

		--Insert prd_info

		SET @start_time = GETDATE()
		PRINT('Truncating Table: bronze.crm_prd_info')
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT('Inserting Data Into: bronze.crm_prd_info ')
		BULK INSERT bronze.crm_prd_info 
		FROM "D:\SQL Course\Projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv"
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT('>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds')

		--Insert sales_details

		SET @start_time = GETDATE()
		PRINT('Truncating Table: crm_sales_details')
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT('Inserting Data Into: bronze.crm_sales_details ')
		BULK INSERT bronze.crm_sales_details
		FROM "D:\SQL Course\Projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv"
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE()
		PRINT('>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds')


		--ERP
		--Insert erp_cust_az12
		PRINT('-------------------------------')
		PRINT('Loading ERP Tables')
		PRINT('-------------------------------')

		SET @start_time = GETDATE()
		PRINT('Truncating Table: bronze.erp_cust_az12')
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT('Inserting Data Into: bronze.erp_cust_az12')
		BULK INSERT bronze.erp_cust_az12
		FROM "D:\SQL Course\Projects\sql-data-warehouse-project\datasets\source_erp\cust_aZ12.csv"
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE()
		PRINT('>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds')

		--Insert erp_loc_a101

		PRINT('Truncating Table: bronze.erp_loc_a1011')
		TRUNCATE TABLE bronze.erp_loc_a101;

		SET @start_time = GETDATE()
		PRINT('Inserting Data Into: bronze.erp_loc_a101')
		BULK INSERT bronze.erp_loc_a101
		FROM "D:\SQL Course\Projects\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv"
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT('>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds')

		--Insert erp_px_cat_g1v2

		SET @start_time = GETDATE()
		PRINT('Truncating Table: bronze.erp_px_cat_g1v2')
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT('Inserting Data Into: bronze.erp_px_cat_g1v2')
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM "D:\SQL Course\Projects\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv"
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		SET @end_time = GETDATE()
		PRINT('>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds')

		SET @batch_end_time = GETDATE()
		PRINT('>> Bronze Layer Load Duration is: ' + CAST(DATEDIFF(millisecond, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' milliseconds')

	END TRY
	BEGIN CATCH
		PRINT('===============================')
		PRINT('Error ocurred during loading bronze layer')
		PRINT('Error Message: ' + ERROR_MESSAGE())
		PRINT('Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR))
		PRINT('Error State: ' + CAST(ERROR_STATE() AS NVARCHAR))
		PRINT('===============================')
	END CATCH
	
END
