#===================================
# Exploration of NCBirths2004
# Date: 07/07/2026
# Dataset: resample3's NCBirths2004
#===================================

library(ggplot2)

load("~/Projects/NCBirthsData/birth_data_cleaned.RData")

NCBirths <- as.data.frame(birth.data.clean)
                          
#============================
# Histogram with Normal Curve
#============================

# data for normal curve
x_range <- seq(min(NCBirths$Weight), max(NCBirths$Weight), length = 100)
normal_curve <- data.frame(
  x = x_range,
  y = dnorm(x_range, mean = mean(NCBirths$Weight), sd = sd(NCBirths$Weight))
)

ggplot(NCBirths, aes(x = Weight)) + 
  geom_histogram(aes(y = after_stat(density)),
                 bins = 30,
                 fill = "maroon4",
                 color = "white") + 
  geom_line(data = normal_curve, aes(x = x, y = y),
            color="blue4", size = 0.8) +
  labs(title = "Birth Weight with Normal Curve",
       x =  "Weight (grams)",
       y = "Density") +
  theme_minimal()

#======================================
# Histogram with 2 SD Outlier detection
#======================================

lower_bound <- mean(NCBirths$Weight) - 2 * sd(NCBirths$Weight)
upper_bound <- mean(NCBirths$Weight) + 2 * sd(NCBirths$Weight)

ggplot(NCBirths, aes(x = Weight)) + 
  geom_histogram(aes(y = after_stat(density)),
                 bins = 30,
                 fill = "maroon4",
                 color = "white") +
  geom_vline(xintercept = c(lower_bound, upper_bound),
             color = c("red3", "red3"),
             linetype = c("dashed", "dashed"),
             size = 1) +
  annotate("text", x = lower_bound - 400, y = 0.001, 
           label = paste("μ-2σ =", round(lower_bound, 2)), 
           color = "red", size = 3) +
  annotate("text", x = upper_bound + 400, y = 0.001, 
           label = paste("μ+2σ =", round(upper_bound, 2)), 
           color = "red", size = 3) +
  labs(title = "Histogram with 2 SD boundaries",
       x = "Weight (grams)",
       y = "Density") +
  theme_minimal()

#===================================
# Boxplot with IQR Outlier Detection
#===================================

outlier_values_iqr <- boxplot.stats(NCBirths$Weight)$out

outlier_labs_iqr <- data.frame(
  y = outlier_values_iqr,
  label = round(outlier_values_iqr, 2)
)

ggplot(NCBirths, aes(y = Weight)) + 
  geom_boxplot(fill = "maroon4", color = "black") +
  geom_text(data = outlier_labs_iqr, 
            aes(y = y, x = 0.2, label = label), 
            size = 2, color = "red", hjust = -0.2) +
  labs(title = "Boxplot with Outlier Values",
       y = "Weight (grams)") + 
  theme_minimal()

