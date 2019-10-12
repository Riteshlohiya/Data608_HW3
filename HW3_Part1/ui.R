#Data608 HW3 Part1

#Question1
#As a researcher, you frequently compare mortality rates from particular causes across
#different States. You need a visualization that will let you see (for 2010 only) the crude
#mortality rate, across all States, from one cause (for example, Neoplasms, which are
#effectively cancers). Create a visualization that allows you to rank States by crude mortality
#for each cause of death.

library(shiny)
library(ggplot2)
library(dplyr)


data1 <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE, stringsAsFactors = FALSE)

# 2010 only

data2010 <- subset(data1, Year==2010)

# Reasons of death for 2010 

reasons <- unique(data2010$ICD.Chapter)
fluidPage(
  titlePanel("2010 Mortality Rates"),
  fluidRow(selectInput("reasons", "Death Reasons:", choices=sort(reasons))), 
  plotOutput("plot1", height = 750)
  )