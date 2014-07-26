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
    h3("Documentation:"),
    h5("Below are presented plots that represent the quantity of people that have specific hair or eye color based on
        their sex and vice versa. First plot presents quantity for all three characteristics. The two that are below the 
       first one are based on what you select from the drop down at the top of the page. So for example if you
       select Hair - you will be shown with 3 plots - first that is not dependant on the selected item, and shows
       relations between all three characteristics, 2nd one will show relation between hair color and sex
       and the third one will show relation between eye color and hair color. After selecting other item the plots will change
       accordingly."),
    h3("Data summary: "),
    verbatimTextOutput("characteristicsHead"),
    plotOutput("plot1"),
    
    conditionalPanel("input.characteristic != 'Sex'",
      plotOutput("plot3")
    ),
    conditionalPanel("input.characteristic != 'Eye'",
      plotOutput("plot4")
    ),
    conditionalPanel("input.characteristic != 'Hair'",      
      plotOutput("plot2")
    )
    
  )
))
