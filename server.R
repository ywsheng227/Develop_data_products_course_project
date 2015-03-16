library(shiny)
library(caret)

mtcars$am <- as.factor(mtcars$am)
variables <- c("mpg", "cyl", "disp", "wt", "am")
data_subset <- mtcars[, variables]
modFit <- train(mpg ~ cyl + disp + wt + am, 
               method = "glm", 
               data = data_subset)
mpg_prediction <- function(data) predict(modFit, data)

shinyServer(
  function(input, output) {
    output$pred <- renderText({
      cyl <- input$cyl
      disp <- input$disp
      wt <- input$wt
      am <- as.factor(input$am)
      mpg_prediction(data.frame(cyl, disp, wt, am))
    })
  }
)