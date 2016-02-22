library(shiny)
library(class)
x <- as.matrix(read.csv("data/x.csv",header=FALSE))
g <- (read.csv("data/g.csv",header=FALSE))$V1
xnew <- as.matrix(read.csv("data/xnew.csv",header=FALSE))
px1 <- read.csv("data/px1.csv",header=FALSE)$V1
px2 <- read.csv("data/px2.csv",header=FALSE)$V1

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    
    mod15 <- knn(x, xnew, g, k=input$k, prob=TRUE)
    prob <- attr(mod15, "prob")
    prob <- ifelse(mod15=="1", prob, 1-prob)
    prob15 <- matrix(prob, length(px1), length(px2))
    par(mar=rep(2,4))
    title <- paste(input$k,"-Nearest Neighbor", sep='')
    contour(px1, px2, prob15, levels=0.5, labels="", xlab="", ylab="", main=
              title, axes=FALSE)
    points(x, col=ifelse(g==1, "coral", "cornflowerblue"))
    gd <- expand.grid(x=px1, y=px2)
    points(gd, pch=".", cex=1.2, col=ifelse(prob15>0.5, "coral", "cornflowerblue"))
    box()
  })
  
})
