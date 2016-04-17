library(shiny)
library(ggplot2)
library(DT)

studentData <- read.csv("./data/StudentList.csv", stringsAsFactors=FALSE)


shinyServer(function(input, output)
{
  
  output$table <- DT::renderDataTable(DT::datatable(
    {
      data <- studentData
      if (input$Program != "All")
      {
        data <- studentData[studentData$Program == input$Program,]
      }
      data
      #})
    }
  
  ))
  
  output$plot <- renderPlot({
    data <- studentData
    if (input$Program != "All")
    {
      data <- studentData[studentData$Program == input$Program,]
    }
    data
    
    GPA <- data$Final.GPA
    hist(GPA)

    })
  
  output$summary <- renderPrint({

    data <- studentData
    if (input$Program != "All")
    {
      data <- studentData[studentData$Program == input$Program,]
    }
    data
    summary(data$Final.GPA)
  })
})

 
