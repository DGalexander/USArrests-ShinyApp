## server.R ##
library(shiny)

## Load USArrests dataset in the dataset
library(datasets)

## Define a server for the Shiny app
shinyServer(function(input, output) {
  
  ## Filter the data
  mydata <- data.matrix(USArrests)
  
  ## Fill in the spot we created for a plot
  output$crimePlot <- renderPlot({
    
    ## Render a barplot
    barplot(mydata[input$state, -3], 
            main=input$state,
            ylim=c(0,350),
            ylab="Crime rate (per 100,000)",
            xlab="Variable")
  })
  
  ## Fill in the spot we created for a plot
  output$PopPlot <- renderPlot({
      
    ## Render a barplot
    barplot(mydata[input$state, 3], 
            main=input$state,
            ylim=c(0,100),
            ylab="Percent urban population",
            xlab="Variable")
  })
   
  ## Generate a summary of the data
  output$summary <- renderPrint({
    summarydata <- (USArrests)
      summary(summarydata)
  })
    
  ## Generate an HTML table view of the data
  output$table <- renderTable({
    tabledata <- (USArrests[input$state, ])
    tabledata
  })
})
