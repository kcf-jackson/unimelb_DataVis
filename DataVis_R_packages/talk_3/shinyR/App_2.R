# Reference: 
# http://shiny.rstudio.com/
# http://shiny.rstudio.com/tutorial/
#
# We now add an interactive plot (plotly) to the App.
# ui: We need a container for plotly's plot - "plotlyOutput".
# server: We need to specify plot instruction - "renderPlotly({YOUR_R_CODE})".

library(shiny)
library(plotly)

ui <- fluidPage(
  titlePanel("App 2: Let's do an interactive plot"),
  plotlyOutput("interactive_plot_1")   #A container in the UI.
)

server <- function(input, output, session){
  output$interactive_plot_1 <- renderPlotly({
    #Instruction of what to show in the UI. Put your usual plotly code here
    my_x <- -10:10
    my_y <- my_x^2
    plot_ly(x = my_x, y = my_y)
  })
}

shinyApp(ui, server, options = list(display.mode = "showcase"))

