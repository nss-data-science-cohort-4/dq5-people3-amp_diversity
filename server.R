library("tidyverse")
library("readxl")
library("writexl")

function(input, output, session) {
  
  uploaded_time_tracker <- eventReactive(c(input$uploaded_time_tracker),
                                         {
                                           time_tracker <- read_csv(input$uploaded_time_tracker$datapath)
                                           
                                           time_tracker
                                         })
  
  # output$download_time_tracker_template <- downloadHandler(
  #   filename = function(){
  #     paste0(Sys.Date(), "_template-time-tracker.xlsx")
  #   },
  #   content = function(file){
  #     file.copy("data/template-time-tracker.xlsx", file)
  #   }
  # )
  
  
  output$time_tracker_summary <- renderPlot({
    
    input$anaylse_data
    
    uploaded_time_tracker <- isolate(uploaded_time_tracker())
    
    uploaded_time_tracker %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="blue")
    
    
  })
  
  output$cencus <- renderPlot({
    
    input$analyse_data
    
    cencus %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="red")
    
  })
  
}