library(shinythemes)

navbarPage(
  "Allow users to upload data",
  tabPanel(
    "Upload data",
    fluidPage(
      theme = shinytheme("slate"),
      wellPanel(p("Upload your file and click continue. Your file will be checked for errors")),
      fluidRow(
        # column(
        #   downloadButton("download_time_tracker_template",
        #                  "Download template"),
        #   width = 2
        # ),
        column(fileInput("uploaded_time_tracker",
                         label = "Upload your data"),
               width = 6)
      ),
      actionButton("anaylse_data",
                   "Analyse Data",
                   width = "100%"),
      plotOutput("time_tracker_summary")
    )
  ),
  collapsible = TRUE
)