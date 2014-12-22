library(shiny)


shinyServer(function(input, output, session) {
  # Define a reactive expression for the document term matrix
  output$plot<-renderPlot({ 
     input$plotButton
     nameIn<-""
     isolate(nameIn<-input$nameInput[1])
     sexStr=""
     isolate( {
     if (input$radio == 1)
     {
       sexStr = "M"
     }
     else
     {
       sexStr = "F"
     }
     })
     fYear<-""
     tYear<-""
     isolate({fYear<-as.numeric(input$fromYear)})
     isolate({tYear<-as.numeric(input$toYear)})
     namescape<-subset(babynames::babynames,name==nameIn & sex==sexStr & 
                         year >= fYear & year <= tYear, select=c(year,n))
     if (length(namescape$year > 0)) {
        plot(namescape$year,namescape$n,type="l",xlab="Year", ylab="Frequency of name") 
       }
     })
})