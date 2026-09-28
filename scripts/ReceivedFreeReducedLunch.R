library(readr)
library(ggplot2)
library(dplyr)
library (tidyverse)

npsas2020_studentparents_data <- read_csv("data/npsas2020_studentparents_data - data.csv")

free_reduced_school_lunch <- npsas2020_studentparents_data %>%
  filter(measure == "Received federal benefit: Free or Reduced Price School Lunch Benefits")

ggplot(
free_reduced_school_lunch,
  aes(
    x = category,
    y = percent,
    fill = has_dependent_children
  )
) +
  geom_col(position = "dodge") +
  geom_text(
    aes(label = paste0(round(percent, 1), "%")),
    position = position_dodge(width = 0.9),
    vjust = 1.5,
    color = "white",
    size = 3
  ) +
  scale_fill_manual(
    values = c(
      "No" = "#608e3a",
      "Yes" = "#3a4972"
    ),
    labels = c(
      "No" = "No dependent children",
      "Yes" = "Has dependent children"
    )
  ) +
  labs(
    title = "Receipt of Free and Reduced School Lunch Benefits Among Undergraduate Students, by Student Parent Status",
    subtitle = "National Postsecondary Student Aid Study, Undergraduate (2020)",
    x = "Free and Reduced School Lunch Benefit Receipt",
    y = "Percent of Students",
    fill = "Student Parent Status"
  ) +
  theme_minimal() +
  theme(
    text = element_text(family = "Helvetica"),
    plot.title = element_text(size = 10),
    plot.subtitle = element_text(size = 8)
  )