
# a3e5cc20ff49e0c36b9c0350531d9a7f1b9dc43c
install.packages("tidycensus")
install.packages("censusapi")
# Load the tidycensus package into your R session
library(tidycensus)
library(tidyverse)
library(censusapi)

# Define your Census API key and set it with census_api_key()
api_key <- "a3e5cc20ff49e0c36b9c0350531d9a7f1b9dc43c"
census_api_key(api_key)

# Check your API key
Sys.getenv("CENSUS_API_KEY")

library(tidycensus)


apis <- listCensusApis()
view(apis)

# Obtain and view state populations from the 2010 US Census
# Download table "B19001"
acs1 <- getCensus(
  key = api_key,
  name = "acs/acs1/profile", 
  vintage = 2019,
  #pull in variables for race, gender, age, disability, veteran, sexual orientation(if possible)
  #I will attempt use variables with "percentage" instead of "estimate"
  vars = c("DP05_0076PE", "DP05_0033PE", "DP05_0025PE", "DP02_0076PE", "DP05_0039PE", "DP05_0038PE", "DP05_0044PE", "DP05_0052PE","DP05_0037PE", "DP05_0035PE", "DP05_0027PE", "DP05_0026PE", "DP02_0070PE", "DP05_0071PE"),
  #Davidson County
  region = 'county:037', 
  #State of TN
  regionin = 'state:47') #State of TN

view(acs1)

# Assign Census variables vector to race_vars
race_vars <- c(White = "B03002_003", Black = "B03002_004", Native = "B03002_005", 
               Asian = "B03002_006", HIPI = "B03002_007", Hispanic = "B03002_012")

tn_race <- get_acs(geography = "county", 
                   state = "TN",
                   variables = race_vars, 
                   sex = 'Male','Female',
                   summary_var = "B03002_001")
view(tn_race)

tn_race %>%
  ggplot(aes(NAME, fill = variable)) + 
  geom_bar()

sum(tn_race$estimate)
