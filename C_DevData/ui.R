library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Predicting Miles Per Gallon" ),
  
  # Sidebar with controls to select the feature to predict mpg

  sidebarPanel(
    
    h5('Please select a contineous feature from the data set that you want to use to predict "miles per gallon".'),
    
    radioButtons("feature", "Feature:",
                 c("Displacement" = "disp",
                   "Horsepower" = "hp",
                   "Weight" = "wt",
                   "1/4 Mile Time" = "qsec"))
    
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),
    
    plotOutput("mpgPlot"),
    
    verbatimTextOutput("fit")
  )
))
