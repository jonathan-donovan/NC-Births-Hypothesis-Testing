#=============================================
# Comparison of NCBirths2004 to National Data
# Date: 10/07/2026
# Dataset: resample3's NCBirths2004
#=============================================
library(ggplot2)

load("C:/Users/jdono/OneDrive/Documents/Projects/NCBirthsData/data/birth_data_cleaned.RData")

NCBirths <- as.data.frame(birth.data.clean)


#==================
# Normality Test
#==================

shapiro_result <- shapiro.test(NCBirths$Weight)

if (shapiro_result$p.value > 0.05) {
  cat("Data passes Shapiro-Wilk normality test \n p value is:",
      round(shapiro_result$p.value, 3))
} else {
  cat("Data does not pass Shapiro-Wilk normality test \n p value is:",
      round(shapiro_result$p.value, 3))
}

if(length(NCBirths$Weight) > 30) {
  cat("Robust to non-normality due to Central Limit Theorem sample size > 30")
}else {
  cat("Central limit theorem does not apply, sample size <= 30")
}

#===========================================
# T-test comparison to national average data
#===========================================

# Descriptive Statistics

n <- length(NCBirths$Weight)
sample.mean <- mean(NCBirths$Weight)
sample.sd <- sd(NCBirths$Weight)
national.mean <- 3316
alpha <- 0.05

cat("There are ", n,  " observations (", n-1, " Degrees of freedom ) \n",
    "With sample mean", sample.mean, "grams, \n national mean", national.mean,
    "grams, \n and sample standard devation", sample.sd)

cat("H0: North Carolina average birth weight is less than or equal to National average birth weight \n",
    "Ha: North Carolina average birth weight is greater than the National average birth weight")


#=========================================
# Using observed value and critical value
#=========================================

t.statistic <- ( sample.mean - national.mean ) / ( sample.sd / sqrt(n) )

t.critical <- qt(1-alpha, n-1)

if (t.statistic > t.critical) {
  cat("Reject H0: NC birth weights are significantly larger than national mean\n",
  "alpha:",alpha)
} else {
  cat("Fail to reject H0: No evidence that NC birth weights are larger\n",
      "alpha:",alpha)
}

#=====================
# Using p-values
#=====================

p.value <- pt(t.statistic, df = n - 1, lower.tail = FALSE)
if (p.value < alpha) {
  cat("Reject H0: p-value =", p.value)
} else {
  cat("Fail to reject H0: p-value =", p.value)
}


#=================
# Visualization
#=================

x <- seq(-9,9, length.out = 1009)
df_plot <- data.frame(x = x, y = dt(x, df= n-1))

reject <- seq(t.critical, 4, length.out = 1009)
df_shade <- data.frame(x = reject, y = dt(reject, df = n-1))

ggplot(df_plot, aes(x = x,y = y)) +
  geom_line(size = 1.2)+
  geom_ribbon(data = df_shade,
              aes(x=x, ymin=0, ymax = y),
              fill = "red3", alpha = 0.5) +
  geom_vline( xintercept=t.statistic, color = "blue")+
  geom_vline( xintercept=t.critical, color = "red2", linetype = "dashed")+ 
  labs(title = paste("t-distribution with", n-1, "df"),
       x = "t_value", y = "Density") +
  annotate("text", x=1.8, y=-0.05, label = "critical value", color = "red3")+
  annotate("text", x=8.6, y = -0.05, label = "observed value", color = "blue")+
  theme_minimal()
              

#=========================
# Using premade function
#=========================


t.test.result <- t.test(NCBirths$Weight, mu = national.mean, alternative = "greater")
print(t.test.result)

#===================================
# Cohen's d Calculation (One-Sample)
#===================================
# Benchmark Guidelines
#   Small Effect:  d ≈ 0.20
#   Medium Effect: d ≈ 0.50
#   Large Effect:  d ≈ 0.80
#===================================
cohens.d <- (sample.mean - national.mean) / sample.sd
cat("Cohen's d:", round(cohens.d,2))
