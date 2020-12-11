library(shinythemes)

navbarPage(
  "Allow users to upload data",
  tabPanel(
    "Upload data",
    fluidPage(
      theme = shinytheme("slate"),
      wellPanel(p("Please upload a .csv file."),
                p("Your file will be checked for errors")),
      fluidRow(
        column(fileInput("uploaded_data_file)",
                         label ="Upload your data"),
               width = 6),
        selectInput("Race",
                    "Race:",
                    choices = sort(tn_race$variable)
        ),
      ),
      actionButton("anaylse_data",
                   "Analyse Data",
                   width = "100%"),

      plotOutput("data_summary")
    )
  ),
  collapsible = TRUE
)