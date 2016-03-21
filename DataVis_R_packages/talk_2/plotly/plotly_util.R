wrap_plotly_data <- function(df0, num_col, name_vector) {
  df0 <- as.matrix(df0)
  begin_column_index <- seq(1, ncol(df0), num_col)
  res <- df0[, 1:num_col]
  group_no <- 1
  res <- cbind(res, rep(group_no, nrow(df0)))
  for (i in tail(begin_column_index, -1)) { 
    group_no <- group_no + 1
    next_group <- cbind(df0[, i:(i + num_col - 1)], rep(group_no, nrow(df0)))
    res <- rbind(res, next_group)
  }
  res <- res[!apply(res, 1, FUN = function(r0){ 
    r0 <- head(r0, -1)
    all(r0 == "" | is.na(r0)) 
  }), ]
  res <- data.frame(res, stringsAsFactors = FALSE)
  colnames(res) =  c(name_vector, 'Group_num')
  res
}

is_empty <- function(x) {
  length(x) == 0
}


add_annotation_to_heatmap <- function(z) {
  text_annotation <- list()
  counter <- 0
  for (i in 1:ncol(z)) {
    for (j in 1:nrow(z)) {
      counter <- counter + 1
      text_annotation[[counter]] <- 
        list(x = i - 1, y = j - 1,
             font = list(color='white'),
             text = z[j, i],
             xref = 'x', yref = 'y',
             showarrow = FALSE)
    }
  }
  text_annotation
}

add_list_to_end <- function(list0, l0){
  list0[[length(list0) + 1]] <- l0
  list0
}


#' @param dates0 character strings; dates in format "yyyy-mm-dd".
convert_dates_to_coordinates <- function(date0){
  as.numeric(as.Date(date0)) * 86400000
}
