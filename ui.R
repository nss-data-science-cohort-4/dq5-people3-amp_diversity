library(shinythemes)
shinyUI(
  dashboardPage(
  
    # Application title
    dashboardHeader(title = "Demographic Data"),
    
 
    
    dashboardSidebar(
 
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
        column(width = 4, # Race graphs for cencus
               box(width = NULL, title = 'Bar Chart',
                   plotOutput("cencusagePlot")
               )
        ),
        column(width = 4, # Race graphs for cencus
               box(width = NULL, title = 'Bar Chart',
                   plotOutput("cencusracePlot")
               )
        ),
        column(width = 4, # education graphs for cencus
               box(width = NULL, title = 'Bar Chart',
                   plotOutput("cencuseducationPlot")
               )
        ),
        # men and women and age
        column(width = 4,
               box(width = NULL,
                   plotOutput("UploadAge")
               )
        ), # race graph
        column(width = 4,
               box(width = NULL,
                   plotOutput("UploadRace")
               )
        ),# education to graphs
        column(width = 4,
               box(width = NULL,
                   plotOutput("UploadEducation")
               )
        )
      ),

    )
    
  )
)
