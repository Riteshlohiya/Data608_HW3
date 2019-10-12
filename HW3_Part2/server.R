library(shiny)
library(ggplot2)
library(dplyr)

data1 <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE, stringsAsFactors = FALSE)

shinyServer(function(input, output) {
  output$gph <- renderPlot({
    data <- data1 %>% 
      filter(State==input$states, ICD.Chapter==input$reasons)
    usavg <- data1 %>% 
      filter(ICD.Chapter==input$reasons) %>% 
      group_by(Year) %>% 
      summarise(yr_rate=(sum(as.numeric(Deaths))/sum(as.numeric(Population))*100000))
    ggplot(data, aes(x=Year, y=Crude.Rate, color='red')) + geom_line(size=2.5) + geom_line(aes(x=usavg$Year, y=usavg$yr_rate, color='blue'),size=2.5) + 
      scale_color_manual(
        values=c('blue'='blue', 'red'='red'), 
        labels=c('Average', 'State'))
    })
  })