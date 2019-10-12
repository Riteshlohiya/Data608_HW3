#Data608 HW3 Part2

#Question2

#Often you are asked whether particular States are improving their mortality rates (per cause)
#faster than, or slower than, the national average. Create a visualization that lets your clients
#see this for themselves for one cause of death at the time. Keep in mind that the national
#average should be weighted by the national population.


data1 <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE, stringsAsFactors = FALSE)


# Reasons of death and states

reasons<-unique(data1$ICD.Chapter)
states<-unique(data1$State)

shinyUI(fluidPage(
  title = "Mortality Rates of States",
  fluidRow(column(5, selectInput('reasons', 'Death reasons', choices=sort(reasons)) ), column(5, selectInput('states', 'State', choices=sort(states)) )),
  fluidRow(plotOutput('gph')
           )
  ))