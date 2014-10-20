library(shiny)
library(datasets)

mpgData <- mtcars

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$feature)
  })
  
  # Fit a linear regression model based on the selected feature. 
  # This is also used by the output$mpgPlot expression
   fit <- reactive({
     lm(as.formula(formulaText()), data=mpgData)
   })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested feature against mpg 
  output$mpgPlot <- renderPlot({
    plot(as.formula(formulaText()), 
            data = mpgData, pch=21, bg="lightblue")
  abline(fit(), col="red", lw=3)
  })
  

  # Print out model fit parameters
  output$fit <- renderPrint({
  summary(fit())
})

})

