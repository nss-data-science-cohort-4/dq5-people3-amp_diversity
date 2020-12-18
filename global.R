library(shiny)
library(tidyverse)
library(shinydashboard)

# upload should be what ever the cencus data is
# This data will show on the top row of the application
# Should be 2 columns and 29 rows

census_data <- read_csv('upload.csv')


