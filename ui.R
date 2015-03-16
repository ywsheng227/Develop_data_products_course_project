library(shiny)

shinyUI(pageWithSidebar(
  titlePanel("Prediction of MPG from Number of Cylinders, Displacement, 
             Vehicle Weight, and Transmission Type"),
  sidebarPanel(
    numericInput("cyl", "Input Number of Cylinders", 6, min=4, max=8, step=1),
    numericInput("disp", "Input Displacement (cu.in.)", 230, min=70, max=480, step=10),
    numericInput("wt", "Input Weight (lb/1000)", 3.2, min=1.5, max=5.5, step=0.1),
    selectInput("am", "Choose Transmission:", 
                choices=c('Automatic'=0, 'Manual'=1)),
    submitButton("Submit")
  ),
  mainPanel(
    h3 ('The Predicted MGP is:'),
    verbatimTextOutput('pred')
  )
))