library(shiny)
library(ggplot2)
library(DT)

studentData <- read.csv("./data/StudentList.csv", stringsAsFactors=FALSE)

shinyUI(pageWithSidebar(
  headerPanel("Student Portal"),
  
  sidebarPanel(
    selectInput("Program", "Choose a program:", 
                choices = c("All", unique(as.character(studentData$Program))))
    
#     sliderInput("PhDGPA", "Final PhD GPA:", 
#                 min=2, max=4, value=3.5, step = 0.1),
#     
#     sliderInput("MSGPA", "Final Master GPA:", 
#                 min=2, max=4, value=3.5, step = 0.1)
    #submitButton("Update View")
  ),

   mainPanel(
     DT::dataTableOutput("table"),
     # Create plot of distribution of GPAs based on Program chosen
     plotOutput("plot"),
     verbatimTextOutput("summary")
     
   )
)
)