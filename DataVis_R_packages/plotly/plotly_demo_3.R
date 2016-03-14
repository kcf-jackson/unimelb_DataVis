source('plotly//plotly_util.R')
Candidates <- c(
  "Bush", "Rubio", "Walker", "Trump", "Kasich", "Cruz", "Huckabee", 
  "Fiorina", "Paul", "Carson", "Christie", "Santorum", "Perry", 
  "Jindal", "Graham", "Pataki")
Polls <- c("Prediction Market", "NationalEndorsements", "Iowa Polls", 
           "New Hampshire Polls", "Money Raised")
score_board <- rbind(c(1, 2, 3, 4, 5, 6, 7, 7, 9, 9, 11, 11, 13, 13, 13, 13), 
      c(1, 7, 5, 12, 5, 4, 7, 12, 2, 12, 3, 7, 7, 12, 7, 12),
      c(4,7,2,1,10,5,7,6,9,3,12,14,12,11,15,16),
      c(2,9,4,1,3,8,11,10,6,6,5,14,14,12,14,13),
      c(1,3,4,14,8,2,12,13,7,9,6,16,5,10,11,15))

score_board_data <- list(Polls = Polls, 
                         Candidates = Candidates, 
                         score_board = score_board)

## d3heatmap
# score_board_data <- data.frame(score_board)
# row.names(score_board_data) <- Polls
# colnames(score_board_data) <- Candidates
# save(score_board_data, file = 'input_output//plotly_demo_3')
# 
# load('input_output//plotly_demo_3', verbose = T)
# library(d3heatmap)
# d3heatmap(score_board_data, dendrogram = 'none')

text_annotation <- add_annotation_to_heatmap(score_board)
source_annotation <- list(x=0, y=-0.1, font= list(size = 11), showarrow=FALSE,
     text="Data source:<a href='http://www.nytimes.com/interactive/2015/08/06/upshot/2016-republican-presidential-candidates-dashboard.html'> [1]</a>",
     xanchor='left', xref='paper', yanchor='bottom', yref='paper')
text_annotation <- add_list_to_end(text_annotation, source_annotation)

library(plotly)
plot_ly(score_board_data, type = 'heatmap', mode = 'text', 
        x = Candidates, y = Polls, z = score_board, 
        text = score_board, showscale = FALSE) %>%
  layout(title = "A scoreboard for republician candidates as of August 17, 2015 <br> Annotated heatmap",
         xaxis = list(title = "", side = 'top'),
         yaxis = list(title = ""), height = 450, 
         margin = list(r=40, t=140, b=40, l=180),
         annotations = text_annotation)

