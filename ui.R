library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("K-Nearest Neighbor"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("k",
                   "K:",
                   min = 1,
                   max = 100,
                   value = 3)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot",width="600px", height="600px")
    )
  )
))
