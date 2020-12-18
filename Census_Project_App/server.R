

shinyServer(function(input, output) {
    #uploaded_data <- eventReactive(c(input$file),
    #                          {
    #                             file_tracker <- read_excel(input$file$datapath, 3)
    #
    #                            file_tracker
    #                         })

    output$censusracePlot <- renderPlot({
        # plot data for distribution of Sex
        if(is.null(input$file))
        { census_data %>%
                slice(1:14) %>%
                ggplot(aes(x=Percentage, y=Variable)) +
                #ggtitle("Census Age") +
                geom_bar(stat="identity",fill="orange",alpha=0.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
        else
        {
            file_tracker <- read_excel(input$file$datapath, 3)
            newdf <- merge(census_data, file_tracker, by = "index")
            ggplot(newdf %>% slice(1:14)) +
                #ggtitle("Census Age") +
                geom_col(aes(x=Percentage, y=Variable),fill="orange",alpha=0.3) +
                geom_col(aes(x=Percentage1,y=Variable1),fill="black",width=.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())         }

    })

    output$censusagePlot <- renderPlot({
        # graph for Race on census
        if(is.null(input$file))
        { census_data %>%
                slice(15:22) %>%
                ggplot(aes(x=Percentage, y=Variable)) +
                #ggtitle("Census Race") +
                geom_bar(stat="identity",fill="orange",alpha=0.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
        else
        {
            file_tracker <- read_excel(input$file$datapath, 3)
            newdf <- merge(census_data, file_tracker, by = "index")
            ggplot(newdf %>% slice(15:22)) +
                #ggtitle("Census Age") +
                geom_col(aes(x=Percentage, y=Variable),fill="orange",alpha=0.3) +
                geom_col(aes(x=Percentage1,y=Variable1),fill="black",width=.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
    })

    output$censuseducationPlot <- renderPlot({
        # Graph Education distribution of census
        if(is.null(input$file))
        { census_data %>%
                slice(23:28) %>%
                ggplot(aes(x=Percentage, y=Variable)) +
                # ggtitle("Census Education") +
                geom_bar(stat="identity",fill="orange",alpha=0.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
        else
        {
            file_tracker <- read_excel(input$file$datapath, 3)
            newdf <- merge(census_data, file_tracker, by = "index")
            ggplot(newdf %>% slice(23:28)) +
                #ggtitle("Census Age") +
                geom_col(aes(x=Percentage, y=Variable),fill="orange",alpha=0.3) +
                geom_col(aes(x=Percentage1,y=Variable1),fill="black",width=.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
    })
    output$censussexPlot <- renderPlot({
        # Graph Education distribution of census
        if(is.null(input$file))
        { census_data %>%
                slice(29:30) %>%
                ggplot(aes(x=Percentage, y=Variable)) +
                # ggtitle("Census Gender") +
                geom_bar(stat="identity",fill="orange",alpha=0.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
        else
        {
            file_tracker <- read_excel(input$file$datapath, 3)
            newdf <- merge(census_data, file_tracker, by = "index")
            ggplot(newdf %>% slice(29:30)) +
                #ggtitle("Census Age") +
                geom_col(aes(x=Percentage, y=Variable),fill="orange",alpha=0.3) +
                geom_col(aes(x=Percentage1,y=Variable1),fill="black",width=.3)+
                theme(plot.title = element_blank(),axis.title.y = element_blank())
        }
    })

})
