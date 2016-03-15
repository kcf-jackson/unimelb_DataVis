# source('plotly//plotly_util.R')

# #Data loading and cleaning
# file_path <- 'plotly//life-expectancy-years-vs-gdp-per-capita-2000-dollars.csv'
# life_expectancy <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)
# life_expectancy <- wrap_plotly_data(life_expectancy, 4, 
#                     c("Life_expectancy", "Country", "Marker_Size", "GDP_per_capita"))
# library(dplyr)
# library(magrittr)
# life_expectancy$Country <- sapply(life_expectancy$Country, FUN = function(t0) {
#   t1 <- strsplit(t0, split = "Country: ")[[1]][2]
#   t2 <- strsplit(t1, split = "<br>")[[1]][1]
#   t2
# }) %>% as.vector()
# for (i in c(1,3:5)) {
#   life_expectancy[,i] %<>% as.numeric()
# }
# save(life_expectancy, file = 'input_output//life_expectancy')


#Plotting with plotly
load('input_output//life_expectancy', verbose = T)
plot_ly(life_expectancy, mode = 'markers',
        x = GDP_per_capita, y = Life_expectancy, 
        marker = list(size = Marker_Size, 
                      color = ggthemes::colorblind_pal()(5)[Group_num]),
        hoverinfo = 'text', text = Country) %>%
  layout(title = "",
         xaxis = list(title = "GDP per capita"),
         yaxis = list(title = "Life Expectancy (years)"),
         height = 450, width = 680)


#Plotting with ggplot
# ggplot(life_expectancy, aes(x = GDP_per_capita, y = Life_expectancy)) + 
#   geom_point(aes(size = Marker_Size, color = as.character(Group_num))) + 
#   labs(title = "Anticipated personal spending for 2013, USD",
#        x = "GDP per capita",
#        y = "Life Expectancy (years)")
