# Reference: 
# http://shiny.rstudio.com/
# http://shiny.rstudio.com/tutorial/
# http://shiny.rstudio.com/tutorial/lesson3/
#
# We illustrate how to do dynamic update with a clustering example.
# ui: We first divide the screen into left and right sides using 'sidebarPanel' and 'mainPanel'.
#     We add a slider "sliderInput" on the left and two plots "plotlyOutput" on the right.
# server: We specify instructions for the plots - "renderPlotly({YOUR_R_CODE})".
#         Note that the slider stores the number selected in the variable 'k' as we named below.


#Simulate some data 
library(plotly)
library(dplyr)
set.seed(2014)
centers <- data.frame(cluster=factor(1:3), size=c(100, 150, 50), 
                      x1=c(5, 0, -3), x2=c(-1, 1, -2))
original_data <- centers %>% group_by(cluster) %>%
                    do(data.frame(x1=rnorm(.$size[1], .$x1[1]),
                                  x2=rnorm(.$size[1], .$x2[1])))
training_data <- cbind(x1 = original_data$x1, x2 = original_data$x2)


#shinyApp
ui <- fluidPage(
  titlePanel("App 5: Cluster analysis"),
  sidebarPanel(width = 3,
    sliderInput("k", "Number of clusters:",  
                min = 1, max = 10, value = 3)   #store the input in variable 'k'
  ),
  mainPanel(
    fluidRow(column(6, plotlyOutput("plot_1")),
            column(6, plotlyOutput("plot_2")))
  )
)

server <- function(input, output, session){
  output$plot_1 <- renderPlotly({
    plot_ly(data = original_data, x = x1, y = x2, color = cluster, mode = 'markers') %>%
      layout(title = "Data")
  })
  output$plot_2 <- renderPlotly({
    #use the input ("input$k") from UI to render output
    kmean_results <- kmeans(training_data, input$k) %>% broom::augment(training_data)
    plot_ly(data = kmean_results, x = x1, y = x2, color = .cluster, mode = 'markers') %>% 
      layout(title = "k-mean clustering")
  })
}

shinyApp(ui, server, options = list(display.mode = "showcase"))

