 library(shiny)
 library(reactable)
 library(shinyWidgets)
 library(gfonts)
 library(tidyverse)
 
 source("global.R")
 
 #ui
 ui <- fluidPage(theme = "css/nes.min.css",
                 use_font("press-start-2p", "www/css/press-start-2p.css"),
                 shinyWidgets::setBackgroundImage(src="img/bg.png"),
                 string_snow,
                 
                 h1("December 2020", align="center"),
                 br(),
                 column(width=12, 
                        offset=2,
                        br(),br(),
                        br(),br(),
                        br(),br(),
                     reactableOutput('sales',  width="1200px", height="700px")
                     )
 )
  
 #server
 server <- function(input, output, session) {
     
     #read data
     dec <- read_csv("www/data/dec.csv")
     
     #basic manip
     my_cal <- dec %>%
         mutate_if(is.numeric, as.character) %>%
         mutate(Tuesday =  paste0('<p>',Tuesday,'</p>',
                                   '<p><img src="https://vignette.wikia.nocookie.net/newsupermariobrothers2/images/2/20/Coin.gif/revision/latest?cb=20120815171249"></img></p>')) %>%
         mutate(Friday = ifelse(Friday == "25",paste0('<p>',Friday,'</p>','<p><img src="http://img1.joyreactor.com/pics/post/gif-christmas-tree-christmas-pixel-art-1003393.gif" height="75"></img></p>'),Friday)) %>%
         mutate(Thursday = ifelse(Thursday == "31",paste0('<p>',Thursday,'</p>','<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/TheEnd.png" height="22"></img></p>'),Thursday))
     
     #reactable
     output$sales <- renderReactable(
         reactable(my_cal,
                   #basic theme options
                   theme = reactableTheme(backgroundColor = "black",
                                          stripedColor = "black",
                                          style=list(color = "white"),
                                          headerStyle = list(borderColor = "black")),
                   
                   #setup basic column definitions
                   #additionally, if a given cell HAS data, add a border
                   defaultColDef = colDef(align = "center",
                                          width = 1200/7,
                                          html  = TRUE,
                                          style = function(value) {
                       if(!is.na(value)) {
                            list(borderRight = '1px solid #ddd', borderBottom = '1px solid #ddd', borderLeft = '1px solid #ddd', borderTop = '1px solid #ddd', height=125)
                       } else {
                           list(borderRight = '1px solid #000',  height=125)
                       }
                   }),
                   
                   #must override the settings 
                   columns = list(Sunday     = colDef(),
                                  Monday     = colDef(),
                                  Tuesday    = colDef(),
                                  Wednesday  = colDef(),
                                  Thursday   = colDef(),
                                  Friday     = colDef(),
                                  Saturday   = colDef()
                   ))
     )
 }
 
 #run
 
 shiny::shinyApp(ui, server)