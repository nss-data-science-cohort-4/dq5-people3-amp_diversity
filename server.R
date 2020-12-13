
shinyServer(function(input, output) {
  uploaded_data <- eventReactive(c(input$file),
                                 {
                                   file_tracker <- read_csv(input$file$datapath)
                                   
                                   file_tracker
                                 })
  
  output$cencusracePlot <- renderPlot({
    # 
    # penguins %>% 
    #     filter(island == input$island) %>% 
    #     drop_na(body_mass_g) %>% 
    #     ggplot(aes(x = body_mass_g)) +
    #     geom_histogram(color = 'black', bins = input$bins)
    cencus %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="red")
    
  })
  output$cencusagePlot <- renderPlot({
    # 
    # penguins %>% 
    #     filter(island == input$island) %>% 
    #     drop_na(body_mass_g) %>% 
    #     ggplot(aes(x = body_mass_g)) +
    #     geom_histogram(color = 'black', bins = input$bins)
    cencus %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="red")
    
  })
  
  output$cencuseducationPlot <- renderPlot({
    # 
    # penguins %>% 
    #     filter(island == input$island) %>% 
    #     drop_na(body_mass_g) %>% 
    #     ggplot(aes(x = body_mass_g)) +
    #     geom_histogram(color = 'black', bins = input$bins)
    cencus %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="red")
    
  })
  
 
  
  output$UploadRace <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # penguins %>%
    #     filter(island == input$island) %>% 
    #     ggplot(aes(x = sex)) +
    #     geom_bar() 
    uploaded_data %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="blue")
    
  })
  
  output$UploadAge <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # penguins %>%
    #     filter(island == input$island) %>% 
    #     ggplot(aes(x = sex)) +
    #     geom_bar() 
    uploaded_data %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="blue")
    
  })
  
  output$UploadEducation <- renderPlot({
    input$load
    uploaded_data <- isolate(uploaded_data())
    # penguins %>%
    #     filter(island == input$island) %>% 
    #     ggplot(aes(x = sex)) +
    #     geom_bar() 
    uploaded_data %>%
      ggplot(aes(x=Values, y=Percentage)) +
      geom_bar(stat="identity",fill="blue")
    
  })
  
})
