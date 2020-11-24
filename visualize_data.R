library("tidyverse")

stuff <- read_csv('Sample_stuff.csv')
glimpse(stuff)

summarise(total_under20 = sum(stuff$`Under 20 years`,na.rm = FALSE)


group_by(`project name`) %>%
  summarise(total_hours = sum(`hours worked`)) %>%
  ggplot(aes(x = fct_reorder(`project name`, total_hours),
             y = total_hours)) +
  geom_col() +
  labs(x = "",
       y = "Total Hours Worked") +
  theme_minimal() +
  coord_flip()