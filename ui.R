## ui.R ##
library(shiny)

## Load USArrests dataset in the dataset
library(datasets)

## Define the overall UI
shinyUI(
  
  ## Use a fluid Bootstrap layout
  fluidPage(    
    
    ## Give the page a title
    titlePanel(strong("Violent Crime Rates by US State")),
    
    ## Generate a row with a sidebar
    sidebarLayout(      
      
      ## Define the sidebar with one input
      sidebarPanel(
        selectInput("state", "Select US State:", 
                    choices=rownames(USArrests)),
        hr(),
        helpText("This data set contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also given is the percent of the population living in urban areas.")
      ),
      
      ## Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Plot", helpText('Output of the State selected on the left:'), 
                             plotOutput("crimePlot"), 
                             plotOutput("PopPlot")),
                    tabPanel("Summary", helpText('Output of the State selected on the left:'), 
                             tableOutput("table"),
                             helpText('Summary output of USArrests data:'), 
                             verbatimTextOutput("summary")) 
                    )
      
    )
  )
)
)

