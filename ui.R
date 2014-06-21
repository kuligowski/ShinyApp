# 
library(shiny)

shinyUI(projectPage(
  headerPanel("Developing data products project"),
  sidebarPanel(
    selectInput("characteristic", "Choose a characteristic:", 
                choices = c("Hair", "Eye", "Sex")),

    numericInput("num", "Number of items to view:", 10)
  ),
  mainPanel(
    characteristicsSummary("characteristicsSummary")
    tableOutput("table")
  )
))
