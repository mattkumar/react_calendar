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
                 br(),
                 h2("December 2020", align="center"),
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
     source("dataprep.R")
   
     #reactable
     output$sales <- renderReactable(
         reactable(my_cal,
                   #basic theme options
                   theme = reactableTheme(backgroundColor = "black",
                                          stripedColor = "black",
                                          style=list(color = "white"),
                                          headerStyle = list(borderColor = "black"),
                                          footerStyle = list(borderColor = "black")),
                   
                   #setup basic column definitions
                   #additionally, if a given cell HAS data, add a border
                   defaultColDef = colDef(align = "center",
                                          width = 171,
                                          html  = TRUE,
                                          style = function(value) {
                       if(!is.na(value)) {
                            list(borderRight = '1px solid #ddd', borderBottom = '1px solid #ddd', borderLeft = '1px solid #ddd', borderTop = '1px solid #ddd', height=125)
                       } else {
                           list(borderRight = '1px solid #000',  height=125)
                       }
                   }),
                   
                   #must override the settings 
                   columns = list(Sunday     = colDef(footer = paste0('<img src="https://vignette.wikia.nocookie.net/newsupermariobrothers2/images/2/20/Coin.gif/revision/latest?cb=20120815171249"></img> Pay Day'),
                                                      footerStyle = list(html=TRUE, fontSize=11)),
                                  Monday     = colDef(footer = paste0('<img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/MarioWalkingR.gif"></img> In Office'),
                                                      footerStyle = list(html=TRUE, fontSize=11)),
                                  Tuesday    = colDef(footer = paste0('<img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/LuigiWalkingR.gif"></img> WFH'),
                                                      footerStyle = list(html=TRUE, fontSize=11)),
                                  Wednesday  = colDef(footer = paste0('<img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/MarioInvincibleR.gif"></img> Vacation!'),
                                                      footerStyle = list(html=TRUE, fontSize=11)),
                                  Thursday   = colDef(footer = paste0('<img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/QuestionBlock.gif"></img> Tenative'),
                                                      footerStyle = list(html=TRUE, fontSize=11))
                   ))
     )
 } 
 
 #run
 
 shiny::shinyApp(ui, server)