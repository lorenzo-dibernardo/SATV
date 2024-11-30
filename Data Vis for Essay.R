library(tidyverse)
library(ggplot2)
library(plotly)
library(psych)

sat.act

clean_stats <- select(sat.act, gender, age, SATV)
clean_stats

# Load ggplot2
library(ggplot2)

# Create age groups for better visualization
clean_stats$age_group <- cut(clean_stats$age, breaks = c(15, 20, 25, 30, 35, 40), right = FALSE)



# Scatterplot
plot1 <- ggplot(clean_stats, aes(x = age, y = SATV, color = factor(gender))) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "SATV Scores by Age and Gender",
       x = "Age",
       y = "SATV Score",
       color = "Gender (1=Male, 2=Female)") +
  theme_minimal()

ggplotly(plot1)

