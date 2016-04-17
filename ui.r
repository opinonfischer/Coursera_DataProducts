library(shiny)
library(ggplot2)
library(DT)

studentData <- read.csv("./data/StudentList.csv", stringsAsFactors=FALSE)

shinyUI(pageWithSidebar(
  headerPanel("Student Portal"),
  
  sidebarPanel(
    h3("Documentation"),
    helpText("This app is for searching, visualizing and sorting through student records. 
             The dataset is notional and includes last and first names of the students, the programs they're in (Doctorate, Doctorate Presidential, MSc), and their GPA. 
             The app provides the user with the capability to visualize students based on the program the students are enrolled in. After the user decided on which program to visualize, the app updates the table, histogram of GPAs and summary table, accordingly."),
    
    selectInput("Program", "Choose a program:", 
                choices = c("All", unique(as.character(studentData$Program))))

  ),

   mainPanel(
     DT::dataTableOutput("table"),
     # Create plot of distribution of GPAs based on Program chosen
     plotOutput("plot"),
     verbatimTextOutput("summary")
     
   )
)
)