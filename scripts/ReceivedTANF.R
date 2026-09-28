library(readr)
library(ggplot2)
library(dplyr)
library (tidyverse)

npsas2020_studentparents_data <- read_csv("data/npsas2020_studentparents_data - data.csv")

TANF <- npsas2020_studentparents_data %>%
  filter(measure == "Received federal benefit: TANF Benefits")

ggplot(
  TANF,
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
    title = "Receipt of TANF Benefits Among Undergraduate Students, by Student Parent Status",
    subtitle = "National Postsecondary Student Aid Study, Undergraduate (2020)",
    x = "Received TANF Benefits",
    y = "Percent of Students",
    fill = "Student Parent Status"
  ) +
  theme_minimal() +
  theme(
    text = element_text(family = "Helvetica"),
    plot.title = element_text(size = 10),
    plot.subtitle = element_text(size = 8)
  )