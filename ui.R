library(shinythemes)
shinyUI(
  dashboardPage(
    # theme = shinytheme("slate"),
    # Application title
    dashboardHeader(title = "Demographic Data"),
    
    # Sidebar with a slider input for number of bins
    
    dashboardSidebar(
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
      column(12,align ="center",offset = 0,actionButton("load","Analyze"))
      
      
    ),
    
    # Show a plot of the generated distribution
    dashboardBody(
      fluidRow(
        column(width = 6,
               box(width = NULL, title = 'Bar Chart',
                   plotOutput("distPlot")
               )
        ),
        
        column(width = 6,
               box(width = NULL,
                   plotOutput("Upload")
               )
        )
      )
    )
    
  )
)
