#
library(shiny)
library(datasets)

characteristicsData <- HairEyeColor

shinyServer(function(input, output) {
  characteristiInput <- reactive({
    switch(input$characteristic,
           "Sex" = Sex,
           "Eye" = Eye,
           "Hair" = Hair)
  })

  # Generate a summary of the dataset
  output$characteristicsSummary <- renderPrint({
    summary(characteristicsData)
  })

  # Show the first "n" observations
  output$table <- renderTable({
    head(characteristiInput(), n = input$num)
  })
})
