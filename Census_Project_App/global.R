library(shiny)
library(tidyverse)
library(shinydashboard)
library(readxl)

# penguins <- read_csv('data/penguins.csv')
#
# island_choices <- sort(unique(penguins$island))

census_data <- read_csv('Census Data.csv')

data <- reactiveValues()
