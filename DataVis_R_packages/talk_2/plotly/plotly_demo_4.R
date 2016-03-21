# load and clean data
file_path <- 'data//indexed-unemployment-levels-since-the-recession-began.csv'
unemployment <- read.csv(file_path, header = T, stringsAsFactors = FALSE)

library(magrittr)
source('plotly//plotly_util.R')
unemployment <- wrap_plotly_data(unemployment, num_col = 2, c("Unemployed", "Dates"))
unemployment[,1] %<>% as.numeric()
unemployment[,3] %<>% as.numeric()
save(unemployment, file = 'input_output//unemployment')


# interactive plot
library(plotly)
load('input_output//unemployment', verbose = T)
#create annotation text
annotation_text <- list(list(x=0.5, y=-0.15, font= list(size = 11), showarrow=FALSE,
                    text="Data: U.S. Bureau of Labor Statistics, Source: <a href='http://qz.com/187731/the-us-government-is-suddenly-set-to-tackle-long-term-unemployment/'> [1]</a>",
                    xanchor='center', xref='paper', yanchor='bottom', yref='paper'))
annotation_text %<>% add_list_to_end(
  list(x = 1.33435841854e+12, y = 500, showarrow = FALSE, 
       text = "Unemployed, six months or more", 
       font = list(color = "rgb(245, 33, 242)"))) %>% 
  add_list_to_end(
    list(x = 1.28955486732e+12, y = 271, showarrow = FALSE, 
         text = "Unemployed, 15-26 weeks",  
         font = list(color = "rgb(108, 56, 109)"))) %>% 
  add_list_to_end(
    list(x = 1.25723230537e+12, y = 103.86, showarrow = FALSE, 
         text = "Unemployed, 5-14 weeks",
         font = list(color = "rgb(222, 133, 224)"), size = 12))


plot_ly(data = dplyr::filter(unemployment, Group_num == 1), 
        x = Dates, y = Unemployed, type = 'scatter',
        line = list(color = "rgb(245, 33, 242)"),
        showlegend = FALSE) %>% 
  add_trace(data = dplyr::filter(unemployment, Group_num == 2), 
            x = Dates, y = Unemployed, type = 'scatter',
            line = list(color = "rgb(108, 56, 109)")) 
  add_trace(data = dplyr::filter(unemployment, Group_num == 3), 
            x = Dates, y = Unemployed, type = 'scatter',
            line = list(color = "rgb(222, 133, 224)")) %>%
  layout(title = "Indexed Unemployment Levels since the Recession began",
         xaxis = list(title = ""), yaxis = list(title = ""), 
         margin = list(r=40, t=50, b=80, l=60), 
         annotations = annotation_text,
         height = 450, width = 680)
  