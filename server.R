
shinyServer(function(input, output) {
  uploaded_data <- eventReactive(c(input$file),
                                 {
                                   file_tracker <- read_csv(input$file$datapath)
                                   # reads csv into data
                                   file_tracker
                                 })
  
  output$cencusagePlot <- renderPlot({
    # plot data for distribution of Sex
    #  takes the first 14  rows and plots
    # Percentage is the percentage of men and women
    census_data %>%
      slice(1:14) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Census Gender") +
      geom_bar(stat="identity",fill="gray", color = 'black')
    
  })
  output$cencusracePlot <- renderPlot({
    # graph for Race on census
    # take the row 15 to 23
    # percentage of race distribution of cencus
    census_data %>%
      slice(15:23) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Census Race") +
      geom_bar(stat="identity",fill="gray", color = 'black')
    
  })
  
  output$cencuseducationPlot <- renderPlot({
    # Graph Education distribution of census
    # take the final rows of the data
    census_data %>%
      slice(24:28) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Cencus Education") +
      geom_bar(stat="identity",fill="gray",color = 'black')
    
  })
  
 
  
  output$UploadAge <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # graph men and women in uploaded data
    uploaded_data %>%
      slice(1:14) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Company Gender") +
      geom_bar(stat="identity",fill="orange",color = 'black')
    
  })
  
  output$UploadRace <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # race data for upload
    uploaded_data %>%
      slice(15:23) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Company Race") +
      geom_bar(stat="identity",fill="orange",color = 'black')
    
  })
  
  output$UploadEducation <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # education data
    uploaded_data %>%
      slice(24:28) %>%
      ggplot(aes(x=Percentage, y=Variable)) +
      ggtitle("Company Education") +
      geom_bar(stat="identity",fill="orange",color = 'black')
    
  })
  
})
