#======================================
# DATA CLEANING NCBirths2004
# Date: 07/06/2026
# Dataset: resampledata3's NCBirths2004
#======================================

# Loading packages

library(resampledata3)
library(dplyr)

# Load data

birth.data <- as.data.frame(NCBirths2004)
names(birth.data)

# Removing NA values from column 6, birth weight

cat("Original dataset dimension: ", dim(birth.data))
birth.data.clean <- birth.data[!is.na(birth.data$Weight), ]
cat("Cleaned dataset dimension: ", dim(birth.data.clean))
cat("Rows removed: ", nrow(birth.data)-nrow(birth.data.clean))

# Calculating z scores for weight

weight.data.clean <- birth.data.clean[,6]
weight.data.mean <- mean(weight.data.clean)
weight.data.sd <- sd(weight.data.clean)
z.scores <- (weight.data.clean - weight.data.mean) / weight.data.sd

# Flagging outliers (|z|>=2)

birth.data.clean$z.score <- z.scores
birth.data.clean$outliers <- ifelse(abs(birth.data.clean$z.score)>=2, "Outlier", "Non-Outlier")

outlier_table <- table(birth.data.clean$outliers)
outlier_summary <- round(prop.table(outlier_table) * 100,2)
cat("Outliers Summary: ")
print(outlier_table)
cat("Outliers Percentages: ")
print(outlier_summary)

save(birth.data.clean, file = "birth_data_cleaned.RData")
