library(shiny)
library(shinyIncubator)

shinyUI(fluidPage(  
  # Application title
  headerPanel("Namesake"),
  
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(width = 5,
      
               # Copy the line below to make a text input box
               textInput("nameInput", label = h3("Name"), value = "Mary"),
               
               hr(),
               
               # Copy the chunk below to make a group of checkboxes
               radioButtons("radio", label = h3("Gender"),
                            choices = list("Male" = 1, "Female" = 2), 
                            selected = 2),
               
              # Copy the line below to make a date range selector
              textInput("fromYear", label = h3("From year"), value = minYear),
              textInput("toYear", label = h3("To year"), value = maxYear ),
              actionButton("plotButton", "Plot"),
              
              br(),
              h3("Documentation:"),
              p("Enter a name, select a gender, and input year ranges (minimum is 1880, maximum 2013) to see a plot of the trend for that particular name over the years")
              
              ),
  
  # Show Word Cloud
   mainPanel(    
    plotOutput("plot")     
   )
))