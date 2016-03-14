#Simulate some data
my_x <- 1:10
my_y <- my_x * sin(my_x)
my_y2 <- my_y + rnorm(10, mean = 0, sd = 5)


#Create interactive plots
#plot, lines, titles, annotation, arrow, xanchor, xref, margin
library(plotly)
plot_ly(x = my_x, y = my_y, name = "LINE 1")
add_trace(x = my_x, y = my_y2, name = "LINE 2")
layout(title = "MAIN HERE",
       xaxis = list(title = "XMAIN"),
       yaxis = list(title = "YMAIN"),
       annotations = list(
         list(text = "Event 1",
              x = 8, y = max(my_y),
              showarrow = F, 
              yanchor = 'bottom'), 
         list(text = "Sources: Randomly generated",
              showarrow = F,
              xref = 'paper', yref = 'paper',
              x = 0, y = -0.1)
       ),
       margin = list(b = 70, t = 50, r = 30, l = 70)
)
