# #Data loading and cleaning
# file_path <- 'data//christmas-gifts-anticipated-personal-spending-for-2013-usd.csv'
# GDP_spending <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)
# 
# GDP_spending <- t(GDP_spending)
# GDP_spending <- rbind(GDP_spending[1:9,], GDP_spending[7,], GDP_spending[10:26, ])
# 
# GDP_spending <- as.vector(unlist(c(GDP_spending[,1], GDP_spending[,2])))
# wrap_seq <- seq(1, length(GDP_spending), 3)
# GDP_spending <- data.frame(GDP_per_person = GDP_spending[wrap_seq],
#                            Country = GDP_spending[wrap_seq + 1],
#                            Anticipated_spending = GDP_spending[wrap_seq + 2])
# GDP_spending <- GDP_spending[,c(2,1,3)]
# GDP_spending[,2] %<>% as.numeric()
# GDP_spending[,3] %<>% as.numeric()
# 
# save(GDP_spending, file = 'input_output//plotly_demo_1')


#Plotting with plotly
load('input_output//plotly_demo_1', verbose = T)
library(plotly)
plot_ly(data = GDP_spending, mode = 'markers+text',  
        x = GDP_per_person, y = Anticipated_spending, 
        text = Country, textposition = 'top',
        marker = list(symbol = "circle-open", 
                      size = 9, 
                      line = list(width = 2))
        ) 
layout(title = "Anticipated personal spending for 2013, USD",
       xaxis = list(title = "GDP per person"),
       yaxis = list(title = "Anticipated spending on Christmas Gift"),
       height = 450, width = 680)

