
shinyServer(function(input, output) {
  uploaded_data <- eventReactive(c(input$file),
                                 {
                                   file_tracker <- read_csv(input$file$datapath)
                                   
                                   file_tracker
                                 })
  
  output$cencusracePlot <- renderPlot({
    # plot data for distribution of Sex
    census_data %>%
      slice(1:14) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Census Gender") +
      geom_bar(stat="identity",fill="red")
    
  })
  output$cencusagePlot <- renderPlot({
    # graph for Race on census
    census_data %>%
      slice(15:23) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Census Race") +
      geom_bar(stat="identity",fill="red")
    
  })
  
  output$cencuseducationPlot <- renderPlot({
    # Graph Education distribution of census
    census_data %>%
      slice(24:28) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Cencus Education") +
      geom_bar(stat="identity",fill="red")
    
  })
  
 
  
  output$UploadRace <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # graph men and women in uploaded data
    uploaded_data %>%
      slice(1:14) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Company Gender") +
      geom_bar(stat="identity",fill="blue")
    
  })
  
  output$UploadAge <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # race data for upload
    uploaded_data %>%
      slice(15:23) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Company Race") +
      geom_bar(stat="identity",fill="blue")
    
  })
  
  output$UploadEducation <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # education data
    uploaded_data %>%
      slice(24:28) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Company Education") +
      geom_bar(stat="identity",fill="blue")
    
  })
  
})
