library(shinythemes)
shinyUI(
    dashboardPage(
        # theme = shinytheme("slate"),
        # Application title
        dashboardHeader(title = "Census Analyzer"),

        # Sidebar with a slider input for number of bins

        dashboardSidebar(id="",
                         menuItem("Dashboard", tabName = "dashboard", icon = icon("user-friends")),
                         menuItem("Assumptions", tabName = "about", icon = icon("user-friends")),

                         # sliderInput("bins",
                         #             "Number of bins:",
                         #             min = 1,
                         #             max = 50,
                         #             value = 30),
                         # selectInput("island",
                         #             "Choose an island:",
                         #             choices = island_choices,
                         #             selected = island_choices[1]),
                         fileInput("file",
                                   "Choose a file:"
                         ),
                         # selectInput("analse_data",
                         #             "Analyse Data"),
                         column(12,align ="center",offset = 0,actionButton("load","Analyze")




                         )

                         # menuItem("Information", icon = icon("th"), tabName = "Information")
                         # Fourth tab content



        ),

        # Show a plot of the generated distribution
        dashboardBody(
            tabItems(

                # Fourth tab content
                tabItem(
                    tabName = "about",
                    fluidPage(
                        h3("Deliverable"),
                        p("Interactive app which allows a user to upload a file with their internal demographics, and compare against US Census data for Davidson County"),

                        h3("Assumptions"),
                        p("Age is concatenated into 10-year increments, e.g. 20-29, 30-39"),
                        p("Education ranges from Less than 9th to Graduate/Professional" ),
                        p("Gender is represented by Females 18 and over and Males 18 and over" ),
                        p("Race reflects the “Alone” options, “Hispanic or Latino of Any Race”, plus “Two or More Races” and “Other”"),

                        h3("Legend"),
                        p("Census Data is in Orange"),
                        p("Company Data is in Black"),


                    )),

                tabItem(
                    tabName = "dashboard",
                    fluidRow(
                        column(width = 6, # Race graphs for census
                               box(width = NULL, title = 'Census Age',
                                   plotOutput("censusracePlot")
                               )
                        ),
                        column(width = 6, # Race graphs for census
                               box(width = NULL, title = 'Census Race',
                                   plotOutput("censusagePlot")
                               )
                        ),
                        column(width = 6, # Race graphs for census
                               box(width = NULL, title = 'Census Education',
                                   plotOutput("censuseducationPlot")
                               )
                        ),
                        column(width = 6, # Race graphs for census
                               box(width = NULL, title = 'Census Gender',
                                   plotOutput("censussexPlot")
                               )
                        ),
                    )
                )
            )
        )
    )
)

# fluidRow(
#   column(width = 6,
#          box(width = NULL, title = 'Bar Chart',
#              plotOutput("distPlot")
#          )
#   ),
#
#   column(width = 6,
#          box(width = NULL,
#              plotOutput("Upload")
#          )
#   )
# )
