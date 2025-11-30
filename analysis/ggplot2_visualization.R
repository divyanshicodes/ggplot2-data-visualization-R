# Data Visualization with ggplot2
# Author: Divyanshi Mishra

# Load library
library(ggplot2)

# Load dataset
data(mpg)

# 1. Explore dataset
?mpg     # help page
head(mpg)
str(mpg)  # inspect data types

# Convert required columns to factor
mpg$manufacturer <- as.factor(mpg$manufacturer)
mpg$year <- as.factor(mpg$year)
mpg$class <- as.factor(mpg$class)
mpg$cyl <- as.factor(mpg$cyl)

# Print all manufacturer names
levels(mpg$manufacturer)

# Summary statistics
summary(mpg$manufacturer)
summary(mpg)

# -----------------------------------------------------
# 2. Data Visualization
# -----------------------------------------------------

# 3a. Histogram of city MPG
g <- ggplot(mpg, aes(x = cty))
g + geom_histogram(binwidth = 1, fill = "skyblue", color = "black")

# 3b. Density plot
g + geom_density(fill = "lightgreen", alpha = 0.6)

# 4a. Bar plot for class
g2 <- ggplot(mpg, aes(x = class))
g2 + geom_bar(fill = "steelblue")

# 4b. Bar plot by class filled by cylinder count
g2 <- ggplot(mpg, aes(x = class, fill = cyl))
g2 + geom_bar()

# 5a. Boxplot of city MPG vs class
g3 <- ggplot(mpg, aes(x = class, y = cty))
g3 + geom_boxplot(fill = "orange")

# 5b. Violin plot
g3 + geom_violin(fill = "lightblue")

# 6a. Scatter plot (cty vs hwy)
g4 <- ggplot(mpg, aes(x = cty, y = hwy))
g4 + geom_point(color = "purple")

# 6b. Scatter plot with color representing class
g4 <- ggplot(mpg, aes(x = cty, y = hwy, color = class))
g4 + geom_point()

# 6c. Scatter plot adding cylinder count as size
g4 <- ggplot(mpg, aes(x = cty, y = hwy, color = class, size = cyl))
g4 + geom_point()

# 7. Count plot of class vs cylinder
ggplot(mpg, aes(x = class, fill = cyl)) +
  geom_bar(position = "stack")
