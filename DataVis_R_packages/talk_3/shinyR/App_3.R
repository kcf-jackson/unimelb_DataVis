# Reference: 
# http://shiny.rstudio.com/
# http://shiny.rstudio.com/tutorial/
#
# We now add one more plot and a story to the App.
# ui: We need a container for the story - fluidRow(column(WIDTH, YOUR_R_CODE))
#     We need an extra container for plotly's plot - "plotlyOutput".
# server: We need to specify plot instruction - "renderPlotly({YOUR_R_CODE})".

library(shiny)
library(plotly)

long_story <- "Your story should go here...'When most I wink, then do mine eyes best see, For all the day they view things unrespected; But when I sleep, in dreams they look on thee, And darkly bright, are bright in dark directed. Then thou, whose shadow shadows doth make bright, How would thy shadow's form form happy show To the clear day with thy much clearer light, When to unseeing eyes thy shade shines so! How would, I say, mine eyes be blessed made By looking on thee in the living day, When in dead night thy fair imperfect shade Through heavy sleep on sightless eyes doth stay! All days are nights to see till I see thee, And nights bright days when dreams do show thee me.' - Shakespeare's sonnets."

ui <- fluidPage(
  titlePanel("App 3: Let's do an interactive plot"),
  fluidRow(column(12, long_story)),
  fluidRow(
    column(6, plotlyOutput("interactive_plot_1")),
    column(6, plotlyOutput("interactive_plot_2"))   #side-by-side plots
  )
)

server <- function(input, output, session){
  output$interactive_plot_1 <- renderPlotly({
    #Put your regular plotly code here
    my_x <- -10:10
    my_y <- my_x^2
    plot_ly(x = my_x, y = my_y)
  })
  output$interactive_plot_2 <- renderPlotly({
    #Put your regular plotly code here
    my_x <- -10:10
    my_y <- sin(my_x)
    plot_ly(x = my_x, y = my_y)
  })
}

shinyApp(ui, server, options = list(display.mode = "showcase"))

