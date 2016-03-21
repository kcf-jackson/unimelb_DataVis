#Reference: 
# http://shiny.rstudio.com/
# http://shiny.rstudio.com/tutorial/
#
# We now add another new tab which contains a d3heatmap and a datatable.
# ui: We need a container for the d3heatmap - "d3heatmapOutput".
#     We need a container for the datatable - "dataTableOutput".
#     One should see a pattern that containers have names "WIDGET_NAMEOutput"
# server: We need to specify instructions for d3heatmap and datatable using 
#         'renderD3heatmap' and 'renderDataTable'. Again there is a pattern here: 
#         renderWIDGETNAME.

library(shiny)
library(plotly)
library(magrittr)
library(d3heatmap)
library(DT)

long_story <- "Your story should go here...'When most I wink, then do mine eyes best see, For all the day they view things unrespected; But when I sleep, in dreams they look on thee, And darkly bright, are bright in dark directed. Then thou, whose shadow shadows doth make bright, How would thy shadow's form form happy show To the clear day with thy much clearer light, When to unseeing eyes thy shade shines so! How would, I say, mine eyes be blessed made By looking on thee in the living day, When in dead night thy fair imperfect shade Through heavy sleep on sightless eyes doth stay! All days are nights to see till I see thee, And nights bright days when dreams do show thee me.' - Shakespeare's sonnets."
another_long_story <- readLines('sample_text.txt') %>% paste(collapse = " ")

ui <- fluidPage(
  titlePanel("Let's do an interactive plot"),
  tabsetPanel(
    tabPanel("Tab 1",
             fluidRow(column(10, long_story)),
             fluidRow(
               column(5, plotlyOutput("interactive_plot_1")),
               column(5, plotlyOutput("interactive_plot_2"))
             )
    ),
    tabPanel("Tab 2",
             fluidRow(
               column(6, plotlyOutput("interactive_plot_3")),
               #column(4, another_long_story)  #direct specification
               column(4, includeMarkdown("sample_text.md"))  #specify through a file
             )
    ),
    tabPanel("Tab 3",
            fluidRow(column(8, d3heatmapOutput("heatmap_1", height = "600px"))),
            fluidRow(column(8, dataTableOutput("table_1")))
    )
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
  output$interactive_plot_3 <- renderPlotly({
    #Put your regular plotly code here
    source('app_data//App_4_plotly.R')
    p
  })
  output$heatmap_1 <- renderD3heatmap({
    #Regular d3heatmap R code
    data(mtcars)
    d3heatmap(mtcars, scale = "column", colors = "Spectral")
  })
  output$table_1 <- renderDataTable({
    #Regular datatable R code
    data(mtcars) 
    datatable(mtcars, options = list(pageLength = 6))
  })
}

shinyApp(ui, server, options = list(display.mode = "showcase"))


