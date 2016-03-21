# Reference: 
# http://shiny.rstudio.com/
# http://shiny.rstudio.com/tutorial/
#
# The basic shinyR infrastructure consists of: ui, server, shinyApp.
# ui: The user interface
# server: The server that performs the dynamic update.
# shinyApp: App initialisation. 
#           'options = list(display.mode = "showcase")' shows your source code with the App.

library(shiny)

ui <- fluidPage(
  titlePanel("App 1: Title here!"),
  mainPanel("Main Panel here")
)

server <- function(input, output, session){}

shinyApp(ui, server, options = list(display.mode = "showcase"))

