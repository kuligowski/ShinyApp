#
library(shiny)
library(datasets)
require(graphics)


characteristicsData <- HairEyeColor

shinyServer(function(input, output) {
  characteristicsInput <- reactive({
    switch(input$characteristic,
           "Sex" = 3,
           "Eye" = 2,
           "Hair" = 1)
  })
  
  output$plot1 <- renderPlot({
    mosaicplot(characteristicsData)
  })
  
  output$plot2 <- renderPlot({
    if (characteristicsInput() != 1) {
      x <- apply(characteristicsData, c(1, characteristicsInput()), sum)
      mosaicplot(x, main = "Relation between hair and selected")
    }
  })
  
  output$plot3 <- renderPlot({
    if (characteristicsInput() != 3) {
      x <- apply(characteristicsData, c(characteristicsInput(), 3), sum)
      mosaicplot(x, main = "Relation between selected and sex")
    }
  })
  
  output$plot4 <- renderPlot({
    if (characteristicsInput() != 2) {
      x <- apply(characteristicsData, c(2, characteristicsInput()), sum)
      mosaicplot(x, main = "Relation between eye and selected")
    }
  })
  
  # Generate a summary of the dataset
  output$characteristicsSummary <- renderPrint({
    summary(characteristicsData)
  })
  
  output$characteristicsHead <- renderPrint({
    head(characteristicsData)
  })
  
})                                                                                                                          
