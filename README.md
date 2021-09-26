# Pewlett-Hackard-Analysis
## Overview
This analysis has been prepared for Pewlett-Hackard management. The goal of the analysis is to provide insight to the number employees that are nearing retirement in each department and to identify current employees that could enter a mentorship program. 

## Results
* There are 90,398 employees nearing retirement as per the 'unique_titles' file
* Pivoting the 'unique_titles' file by title reveals that Senior Engineers and Senior Staff are the two titles with the most employees nearing retirement. Overview below:

![image](https://user-images.githubusercontent.com/85259984/134787892-0cad78a5-41b8-469e-ab21-8eefd4f95001.png)

* There are 1,549 employees eligible for the mentorship program, as per the 'mentorship_eligibility' file
* Pivoting the 'mentorship_eligibility' file by title reveals that Senior Staff, Senior Engineers, and Engineers are the most common title eligible for the program.

![image](https://user-images.githubusercontent.com/85259984/134787928-ce8f5150-16bf-4215-9b9e-b60d15e18c3f.png)

## Summary

* The company defines the large generation of employees that are nearing retirment age as the "silver tsunami". As the silver tsunami begins to make an impact, the company will need to be filling ~90,400 roles. 
* The company has ~1,550 employees that are qualified to be mentors for the next generation of PH employees. The company will need to determine if the ratio of mentor eligible to total employees is satisfactory. 
* The company can use the below query to see the ratio of total employees to mentor eligible employees. The company can use this to determine if they should hire external candidatest that are eligible to mentor:

SELECT 
  count(emp.emp_no),
  count(me.emp_no)

  FROM employees as emp
  FULL JOIN mentorship_eligibility as me
  ON emp.emp_no = me.emp_no

* If hiring external candidates, the company can use the following query to know what to expect the salary would be for each title:

SELECT 
	me.title,
	count(me.emp_no),
	sum(sal.salary),
	sum(sal.salary) / count(me.emp_no) 
	

FROM mentorship_eligibility as me
LEFT JOIN salaries as sal
ON me.emp_no = sal.emp_no

GROUP BY 1

