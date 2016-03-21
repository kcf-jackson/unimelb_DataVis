x <- rnorm(100, mean = 0, sd = 50) / 10
y <- 0.01 * x - rnorm(100, mean = 0, sd = 10) / 10
my_data <- data.frame(x = x, y = y)


plot_title <- "US GDP by metropolitan area"
plot_subtitle <- "Fifty largest economies"
xlabel <- "GDP, % change on previous year, 2010"
ylabel <- "Unemployment, % point change on year ago, Decemeber 2010"

library(ggplot2)
library(ggthemes)
p <- ggplot(my_data, aes(x = x, y = y)) + 
  geom_hline(yintercept = 0, colour = 'red') + 
  geom_vline(xintercept = 0, colour = 'red') +
  geom_point(fill = 'white', colour = 'black', size = 3, pch = 21, stroke = 1) + 
  #title and labels
  # ggtitle(paste(plot_title, plot_subtitle, sep = "\n")) + 
  ggtitle(bquote(atop(bold(.(plot_title)), atop(.(plot_subtitle), "")))) +
  labs(x = xlabel, y = ylabel) +
  #themes
  theme_economist(base_family = "Verdana") +
  theme(plot.margin = margin(0.5, 0.5, 1, 1, 'cm')) + 
  theme(axis.title.y = element_text(face="italic"),
        axis.title.x = element_text(face="italic")) 
  
library(cowplot)
p2 <- add_sub(p, "Sources: Randomly genereated data using rnorm function", size = 12)
ggdraw(p2)
