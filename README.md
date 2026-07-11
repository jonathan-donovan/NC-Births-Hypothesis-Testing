# North Carolina 2004 Birth Weight Analysis

## Overview

This project goes into detail using descriptive statistics, to analyse the birth
weight data of babies born in 2004 in the state of North Carolina and to
determine if they are significantly different from the national average. With 
data from the 'resampledata3' package, I performed standard data cleaning, outlier
detection, an exploratory analysis, and finally a one-sample t-test to compare
the NC birth weight sample mean to the CDC national average.

## Data Source 

The data set is "NCBirths2004" from the "resampledata3" package
The data set contains 1,009 observations
The data set has variables "ID", "MothersAge", "Smoker", "Alcohol", "Gender",
                           "Weight", and "Gestation".
National average is 3,316 grams per CDC's National Vital Statistics Report
"Births: Final Data for 2004" from September 29, 2006.

## Data Cleaning

NCBirths2004 data set was cleaned by removing all NA values from the "weights"
variable as well as checking for outliers using the z-score method of 2 standard
deviations, as 95% of the data should fall within that range. This is useful to
check for erroneous values that would have a high effect on the observed mean.
There were 50 outliers using the two standard deviations criteria, accounting 
for 4.96% of the total observations. The weight data had a mean of 3448.26 grams
and a standard deviation of 487.74 grams.

## Exploratory Analysis

During the exploration, the assumption of normality was tested. A histogram with
a normal curve overlay was presented and found that the data follows a normal
distribution. The same histogram was used with 2 markers showing all of the
bars within a 2 standard deviation range. There were no erroneous observations.
Finally, another method to check for outliers was used: the IQR * 1.5 method.
The exploration contains a boxplot with the outliers outside of this range,
resulting in 9 outliers compared to the z-score method's 50 outliers. 

## Statistical Analysis

During the statistical analysis, using the Shapiro-Wilk test of normality, a
p-value of 0.01 was found, concluding that the data deviates from a strict
normality distribution. However, due to the central limit theorem and
visual aides in the exploratory analysis, a near-normality assumption can be
made, and an inherent understanding that natural phenomenon often
follow a normal distribution and understanding that the Shapiro-Wilk normality
test is often sensitive to outliers when given larger data sets.

The one-sample t-test was then executed to reject or fail to reject the null
hypothesis: 
Babies born in North Carolina in 2004 weigh less than, or equal to, the national
average.
with an alternative hypothesis:
Babies born in North Carolina in 2004 weigh more than the national average.

With 1008 degrees of freedom and 95% confidence level, the critical t value is
1.65 and the observed t value is 8.61, providing evidence that babies born North
Carolina on average, are heavier than those born in the entire nation. Furthermore,
a p-value of 1.35e-17 was found suggesting an extremely low Type I error (false
positive) which also rejects the null hypothesis. A visualization was also made 
using the critical and observed t values. Finally, using a premade function, the
null hypothesis was also rejected. The following data was produced:
t = 8.61, df = 1008, p-value < 2.2e-16. This confirms the previously stated
p-value and observed t value and reaffirms the previous rejection of the null
hypothesis. 

## Limitations

The main limitation of the conclusion that North Carolina births in 2004 are 
heavier than the national average is how much more heavy they were. With a 
difference of 132.26 grams between the two means, this is a small fraction
(3.8%) of the total weight of the babies at birth and may not be considered a
medically significant difference in weight although it is statistically
significant. Also, it is a limited conclusion using data from one state in one
year. 

