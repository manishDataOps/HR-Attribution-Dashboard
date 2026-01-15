
-- Employee Attrition Analysis Report

--(1) Employee Attrition Overview

	SELECT
	COUNT(*) AS total_emp,
	SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) AS total_attrition,
	CONCAT(CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*) AS decimal(5,2)),'%') AS attrition_rate
	FROM rawdata ;

-- (2) Department-wise Attrition Rate

	SELECT 
	Department,
	COUNT(*) AS total_emp,
	SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) AS total_attrition,
	CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*) AS decimal(5,2)) total_attrition_rate
	FROM rawdata
	GROUP BY Department
	ORDER BY total_attrition_rate DESC ;

--(3) Job Role-wise Attrition Rate

	SELECT 
	JobRole,
	COUNT(*) AS total_emp,
	SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) AS total_attrition,
	CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*) AS decimal(5,2)) total_attrition_rate
	FROM rawdata
	GROUP BY JobRole
	ORDER BY total_attrition_rat DESC ;

--(4) Attrition Rate by Salary Band

	SELECT 
	CASE WHEN MonthlyIncome >15000 THEN 'above 15k'
		 WHEN MonthlyIncome BETWEEN 10000 AND 15000 THEN '10K to 15K'
		 WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN '5K to 10k' ELSE '0K to 5k' END AS salary_band,
	COUNT(*) as total_emp,
	SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) AS total_attrition,
	CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*) AS decimal(5,2)) total_attrition_rate
	FROM rawdata
	GROUP BY 
		CASE WHEN MonthlyIncome >15000 THEN 'above 15k'
		 WHEN MonthlyIncome BETWEEN 10000 AND 150000 THEN '10K to 15K'
		 WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN '5K to 10k' ELSE '0K to 5k' END
	ORDER BY total_attrition_rate DESC ;

--(5) Attrition Rate by Work Experience
	
	SELECT
		CASE
			WHEN TotalWorkingYears <= 2 THEN 'under 2 year'
			WHEN TotalWorkingYears BETWEEN 3 AND 5 THEN '3 to 5 year'
			ELSE 'above 5 years' END AS work_experience,
	COUNT(*) AS total_emp,
	SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) AS total_attrition,
	CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*) AS decimal(5,2)) total_attrition_rate
	FROM rawdata
	GROUP BY 
		CASE
			WHEN TotalWorkingYears <= 2 THEN 'under 2 year'
			WHEN TotalWorkingYears BETWEEN 3 AND 5 THEN '3 to 5 year'
			ELSE 'above 5 years' END ;

--(6) Attrition by Distance from Home

	SELECT
	CASE 
		WHEN DistanceFromHome <= 5 THEN 'under 5 km'
		WHEN DistanceFromHome BETWEEN 6 AND 15 THEN '6 to 15 km'
		ELSE 'above 15 KM' END AS distance_band,
	COUNT(*) AS total_emp,
	SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) AS total_attrition,
	CAST(SUM(CASE WHEN Attrition = 'yes' THEN 1 ELSE 0 END ) * 100.0 / COUNT(*) AS decimal(5,2)) total_attrition_rate
	FROM rawdata
	GROUP BY 
		CASE 
		WHEN DistanceFromHome <= 5 THEN 'under 5 km'
		WHEN DistanceFromHome BETWEEN 6 AND 15 THEN '6 to 15 km'
		ELSE 'above 15 KM' END
	

		