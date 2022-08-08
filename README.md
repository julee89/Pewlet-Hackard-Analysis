# Pewlet-Hackard-Analysis
## Analysis Overview
The purpose of this analysis was to help Pewlett Hackard(PH) under make up of their workforce as well as tailoring their multiple sources of data into easy to read lists and tables in preparation of the upcoming 'Silver Tsunami'. 

During this analysis, we took PH's 6 standalone CSV files and migrated it over to a relational database, based in Postgres. This allowing us to create a visual map to show the relations between the isolated csv data sources, which made it easier to understand what strategies need to be taken in preparation for the workforce shift at the company. 

[Employee ERD](Pewlet-Hackard-Analysis\EmployeeDB.png)

This analysis allowed us to understand how many members of the workforce were up for retirement, what positions were held they the retirees and well as what members of the workforce are eligible for mentorship in partnership with the retring workforce.

## Results
### Retiring Workforce
Through this analysis we found that there are 72,458 people retiring from the company out of the 300,024, which is almost 25% of the workforce at PH. Once we found out the proportion of the company retiring, we learned the distribution of titles for the retirees as shown in the list below in descending order.

[Retiring Titles](Resources/retiring_title_count.PNG)

As the list shows, the engineer and staff titles will have the most impact with the 'Silver Tsunami'. Therefore, PH would need to find a way to train the current employees the titles and departments what will have higher impact with these vacancies.

### Mentorship Employees
Upon finding the departments that will be impacted, PH has decided to implement a mentorship program for all the vacancies that need to filled after the retirees leave the roles. PH has decided that all employees born during the year 1965 and still at the company would be eligible for the mentorship company. Upon filtering the list of employees to the birth date criteria and still being employed at the company, it comes to 1,549 employees who are eligible. Once the list is broken down by title counts we find that staff and engineer title have the highest count of employee who are eligible.

[Mentorship Titles](Resources/mentorship_title_count.PNG)

This helps PH understand what resources need to set in place to have retiring employees become mentors for those needing to step into these roles and keep PH functioning.

## Summary
Per this analysis the company will have to prepare to fill or train enough employees to reduce the impact of a 25% workforce loss for the company. Of the 300,024, 72,458 will be part of the 'Silver Tsunami' and impact the employee count. Given the images shown above, the proportion who are eligible are similar to that of the retiring titles, so there be enough employees to be a part of the mentorship. However, on a headcount basis, the number of retiring employees are 46 times the number of employees left for the mentorship. 

After futher anlaysis of the employee headcount, we find that were are still 226,017 employees who are at the company for potential consideration of the mentorship. Rather than having the number of employees be of the birth year 1965, we can consider for anyone who has been at the company for more than 10 years to not have the 'Silver Tsunami' have as big of an impact.