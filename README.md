# NCBirthsData t-test

This project goes into detail of descriptive statistics, specifically on the
detailed use of the one sample t-test, used when the population standard
deviation is unknown to determine the mean of the data.

In this project, the data called NCBirth2004 was collected from the
resampledata3 package. It contains 1009 observations and was subject to cleaning
although there were no values missing allowing for no data loss, observing 
outliers using the criteria of being more than 2 standard deviations from the
mean (z-score method), an exploration and visualization of the normality, 
outliers using the 1.5 * IQR and the z-score methods. Finally, the clean data 
was used to determine if the birth weight of babies born in North Carolina in 
the year 2004 weighed the same or more than the national average for the
United States using national data from the CDC. The understanding of p-values
and critical values were used to fail to accept or accept the hypothesis.

Through the investigation, the assumption of Normalcy was tested through
graphical observation, the shapiro-wilk test, and the Central Limit Theorem. 
Using a right-tail t-test, with a 5% confidence level, the null hypothesis that
babies born in North Carolina weigh the same as the national average was 
rejected. Babies in North Carolina in 2004 weigh more than the national average.
The final p-value was 1.347e-17 with a critical value of 1.646 and a observed
t-value of 8.614. 
