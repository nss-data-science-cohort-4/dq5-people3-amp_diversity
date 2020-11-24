library("tidyverse")
library("readxl")
library("writexl")

function(input, output, session) {
  
  uploaded_data_file <- eventReactive(c(input$uploaded_data_file),
                                         {
                                           data_analyzer <- read_csv(input$uploaded_data_file$datapath)
                                           
                                           data_analyzer
                                         })
  
  output$download_data_analyzer_template <- downloadHandler(
    filename = function(){
      paste0(Sys.Date(), "_template_data.csv")
    },
    content = function(file){
      file.copy("data/template_data.csv", file)
    }
  )
  # what happens when the data is analyzed
  output$data_summary <- renderPlot({
    
    input$anaylse_data
    
    uploaded_data_file <- isolate(uploaded_data_file())
    
    uploaded_data_file %>%
      group_by(`project name`) %>%
      summarise(total_hours = sum(`hours worked`)) %>%
      ggplot(aes(x = fct_reorder(`project name`, total_hours),
                 y = total_hours)) +
      geom_col() +
      labs(x = "",
           y = "Total Hours Worked") +
      theme_minimal() +
      coord_flip()
    
  })
  
}