library(shiny)
library(ggplot2)
library(dplyr)


data1 <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE, stringsAsFactors = FALSE)

#2010 only

data2010 <- subset(data1, Year==2010)

#Reasons of death for 2010

reasons <- as.data.frame(unique(data2010$ICD.Chapter))

function(input, output) {
  rates <- reactive({rates <- subset(data2010, ICD.Chapter==input$reasons)})
  output$plot1 <- renderPlot({
    ggplot(rates(), aes(x=Crude.Rate, y=reorder(State, -Crude.Rate)))+ scale_x_continuous(limits=c(0, max(rates()$Crude.Rate))+1, expand = c(0,0))+
      geom_segment(aes(yend=State), xend=0, color="black")+ geom_point(size=2.5, color = "blue") + theme_bw()+ 
      theme(panel.grid.major.y = element_blank(), axis.title=element_text(size=15))+ xlab("2010 Mortality Rate") + ylab("State") +
      ggtitle(input$reasons)
    }) 
  }

