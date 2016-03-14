file_path <- 'data//the-real-1-percentage-of-americans-who-spend-more-than-one-year-of-their-careers.csv'
income <- read.csv(file_path, header = T, stringsAsFactors = FALSE)
colnames(income) <- c('a20p', 'min_yr', 'a10p', 'a5p', 'a1p')

annotation_text <- list(
  list(
    x = 6.0, y = 1.05, 
    align = "center", 
    showarrow = TRUE, 
    text = "<i>1st percentile</i>",
    ax = 41, ay = 13.75 
  ), 
  list(
    x = 6.02, y = 6.7, 
    showarrow = FALSE, 
    align = 'center',
    text = "<i>5th percentile</i>"
  ), 
  list(
    x = 6.02, y = 18.0, 
    showarrow = FALSE, 
    text = "<i>10th percentile</i>"
  ), 
  list(
    x = 6.03, y = 39.5, 
    showarrow = FALSE, 
    text = "<i>20th percentile</i>" 
  )
)

library(plotly)
plot_ly(income, x = min_yr, y = a1p, fill = "tozeroy", 
       fillcolor = "rgba(44, 160, 44, 0.4)", showlegend = FALSE) %>% 
  add_trace(income, x = min_yr, y = a5p, fill = "tozeroy",
            fillcolor = "rgba(44, 160, 44, 0.2)") %>% 
  add_trace(income, x = min_yr, y = a10p, fill = "tozeroy", 
            fillcolor = "rgba(44, 160, 44, 0.2)") %>% 
  add_trace(income, x = min_yr, y = a20p, fill = "tozeroy", 
            fillcolor = "rgba(44, 160, 44, 0.2)") %>%
  layout(title = "<b>The Real 1%</b><br><i>Percentage of Americans who spend more than one year<br>of their careers in the top percentiles of income (household) </i>",
         xaxis = list(title = "Minimum years in top percentile, between the ages of 25 and 60",
                      range = c(0.5, 10.5)), 
         yaxis = list(title = "Percent", range = c(-5.5, 79)), 
         margin = list(r=40, t=60, b=50, l=60), 
         annotations = annotation_text)
