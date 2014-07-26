# 

library(shiny)

shinyUI(fluidPage(
  titlePanel(h2(span("Hair", style = "color:blue"),"- "
                , span("Eye", style = "color:green")
                , " - ", span("Sex", style = "color:red")
                , " characteristics relations")),
  fluidRow(
    column(10,
  sidebarPanel(
    selectInput("characteristic", "Choose a characteristic:", 
                choices = c("Hair", "Eye", "Sex"))
  ))),
  fluidRow(
    h3("Summary:"),
    verbatimTextOutput("characteristicsSummary"),
    h3("Head: "),
    verbatimTextOutput("characteristicsHead"),
    plotOutput("plot1"),
    plotOutput("plot3"),
    plotOutput("plot4"),
    plotOutput("plot2")
    
  )
))
