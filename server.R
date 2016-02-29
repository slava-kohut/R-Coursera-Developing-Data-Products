library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  #
  # generate means for a number of samples
  #
  
  data <- reactive({
    
    set.seed(12345)
    
    if (input$dist=='norm') {
      means <- NULL
      for (i in 1 : input$numberSamples) means <- c(means, mean(rnorm(input$sampleSize,mean=0.5,sd=0.25)))
    } else if (input$dist=='unif') {
      means <- NULL
      for (i in 1 : input$numberSamples) means <- c(means, mean(runif(input$sampleSize,min=0,max=1)))
    } else if (input$dist=='bernoul') {
      means <- NULL
      for (i in 1 : input$numberSamples) means <- c(means, mean(rbinom(input$sampleSize,size=1,prob=0.5)))
    } else {
      means <- NULL
      for (i in 1 : input$numberSamples) means <- c(means, mean(rnorm(input$sampleSize,mean=0.5,sd=0.25)))
    }
    
    means
    
  })
  
  # 
  # generate a histogram of standardized means 
  # compate it to N(0,1)
  #
  
    output$plotMeans <- renderPlot({
      meansSt<-(data()-mean(data()))/sd(data())
      hist(meansSt, 
           main = "histogram of sample means (standardized) vs. normal distribution",
           xlab="sample mean", 
           ylab="density",probability =TRUE,
           col="green")
      xrange<-seq(-3,3,length=1000)
      norm<-dnorm(xrange)
      lines(xrange,norm,col="blue",lwd=3,lty=5)
   })
    
  #
  # generate a graph of the mean of sample means 
  # as a function of the number of samples 
  #
    
    output$plotConv <- renderPlot({
  
    })
    
  #
  # generate a summary of the data
  #
    output$summary <- renderPrint({
      summary(data())
    })
    
})

