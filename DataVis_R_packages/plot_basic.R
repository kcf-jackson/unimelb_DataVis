## Simulate data
my_x <- as.Date(1:1000, origin = '2013-01-01')
my_y <- 5
for (i in 2:1000){
  my_y[i] <- my_y[i-1] * 0.8 + rnorm(1)
}
my_y2 <- 0.3 * my_y + rnorm(1000, mean = 0, sd = 0.1)


# Basic plots in R
plot(x = my_x, y = my_y)     #plot(my_x, my_y) also works

# data, graph type, labels, legend
plot(x = my_x, y = my_y, 
     type = 'l',
     main = 'Main Here', 
     xlab = 'x-axis label here',
     ylab = 'y-axis label here')
lines(my_x, my_y2, col = 'red')
legend('bottomright', 
       legend = c('black line', 'red line'), 
       lty = c(1,1), col = c('black', 'red'))


# # Quick plots with ggplot2
# library(ggplot2)
# qplot(x = my_x, y = my_y)
# # MAGIC
# plotly::ggplotly()
# 
# # data, graph type, labels, legend
# qplot(x = my_x, y = my_y, color = 'black line', geom = 'line') +
#   geom_line(aes(my_x, my_y2, color = 'red line')) + 
#   scale_colour_manual(name="Legend title", values= c('black', 'red')) + 
#   labs(title = 'Main Here', 
#        x = 'x-axis label here', y = 'y-axis label here') 
# # MAGIC
# plotly::ggplotly()


# ggplot2 plots
library(ggplot2)
my_data <- data.frame(my_x = my_x, my_y = my_y)
ggplot(my_data, aes(my_x, my_y)) + geom_point()
# MAGIC
plotly::ggplotly()

# data, graph type, labels, legend
ggplot(my_data, aes(x = my_x, y = my_y, color = 'black dots')) + 
  geom_point() + 
  geom_line(aes(my_x, my_y2, color = 'red line')) + 
  scale_colour_manual(name="Legend title", 
                      values= c('black', 'red')) + 
  labs(title = 'Main Here', 
       x = 'x-axis label here', y = 'y-axis label here')
# MAGIC
plotly::ggplotly()


#Plotly
plot_ly(x = my_x, y = my_y)

plot_ly(x = my_x, y = my_y, name = 'black line', marker = list(color = 'black') ) %>%
  add_trace(x = my_x, y = my_y2, name = 'red line', marker = list(color = 'red')) %>% 
  layout(title = "Title here",
         xaxis = list(title = "x-axis label"),
         yaxis = list(title = "y-axis label"))
