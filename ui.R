library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("K-Nearest Neighbor"),
  withMathJax(),
  helpText("Given a positive integer \\(K\\) and a test observation
           \\(x_0\\), the KNN classifier first identifies the \\(K\\) 
           points in the training data that are closest to \\(x_0\\), 
           represented by \\(\\mathcal{N}_0\\). It then estimates the 
           conditional probability for class \\(j\\) as the fraction 
           of points in \\(\\mathcal{N}_0\\) whose response values equal 
           \\(j\\): $$\\text{Pr}(Y=j|X=x_0)=\\frac{1}{K}\\sum_{i\\in\\mathcal{N}_0}I(y_i=j)$$.
           Finally, KNN applies Bayes rule and classifies the test observation \\(x_0\\) to the 
           class with the largest probability."),
  
  # Sidebar with a slider input for K 
  sidebarLayout(
    sidebarPanel(
       sliderInput("k",
                   "K:",
                   min = 1,
                   max = 100,
                   value = 3)
    ),
    
    
    mainPanel(
       plotOutput("distPlot",width="600px", height="600px")
    )
  )
))
