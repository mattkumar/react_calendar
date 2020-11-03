 library(shiny)
 library(reactable)
 library(shinyWidgets)
 library(gfonts)
 library(tidyverse)
 
 source("global.R")
 
 #ui
 ui <- fluidPage(#include nes.min.css external file
                 theme = "css/nes.min.css",
                 
                 #include external font file downloaded by gfonts
                 gfonts::use_font("press-start-2p", "www/css/press-start-2p.css"),
                 
                 #set background
                 shinyWidgets::setBackgroundImage(src="img/bg.png"),
                 
                 #HTML for snow effect (see: global.R for definition, references.R for source url)
                 snow_string,

                 #HTML for snow effect (see global.R for definition)
                 string_snow,
                 
                 #General UI formatting
                 br(),
                 h2("December 2020", align="center"),
                 br(),
                 column(width=12, 
                        offset=2,
                        br(),br(),
                        br(),br(),
                        br(),br(), 
                        reactableOutput('cal',  width="1200px", height="700px") 
                     )
 )
  
 #server
 server <- function(input, output, session) {
     
     #read data - loads in blank Dec 2020 calendar and populates it
     source("dataprep.R")
   
     #reactable
     output$cal <- renderReactable(
         reactable(my_cal,
                   
                   #javascipt for modals (see global.R for definition)
                   onClick = js_string,
                   
                   #basic theme options - test driving this approach - some of what's below could be included here too!
                   theme = reactableTheme(backgroundColor = "black",
                                          stripedColor = "black",
                                          style=list(color = "white")),
                   
                   #setup basic column definitions
                   #additionally, if a given cell HAS data, add a border
                   defaultColDef = colDef(align = "center",
                                          width = 171,
                                          html  = TRUE,
                                          headerStyle = list(borderColor = "black"),
                                          footerStyle = list(html=TRUE, fontSize=11, borderColor = "black"),
                                          style = function(value) {
                       if(!is.na(value)) {
                            list(borderRight = '1px solid #ddd', borderBottom = '1px solid #ddd', borderLeft = '1px solid #ddd', borderTop = '1px solid #ddd', height=125)
                       } else {
                           list(borderRight = '1px solid #000',  height=125)
                       }
                   }),
                   
                   #Create footnotes - the styling for footnotes is set in footerStyle in defaultColDef above 
                   columns = list(Sunday     = colDef(footer = paste0('<img src="img/coin.gif"></img> Pay Day')),
                                  Monday     = colDef(footer = paste0('<img src="img/MarioWalkingR.gif"></img> In Office')),
                                  Tuesday    = colDef(footer = paste0('<img src="img/LuigiWalkingR.gif"></img> WFH')),
                                  Wednesday  = colDef(footer = paste0('<img src="img/MarioInvincibleR.gif"></img> Vacation!')),
                                  Thursday   = colDef(footer = paste0('<img src="img/QuestionBlock.gif"></img> Meeting'))
                   ))
     )
     
    
     #Modal 1
     observeEvent(input$show1, {
        showModal(modalDialog(
           title = "Quarterly Meeting",
           HTML('<p><img src="img/test.png" class="center" height="400"></img></p>'),
           HTML('<p><img src="img/zoom.png" class="center" height="70"</img></p>')
        ))
     })
     
     #Modal 2
     observeEvent(input$show2, {
        showModal(modalDialog(
           title = "Placeholder",
           "A placeholder for Modal 2"
        ))
     })
 }
     
 
 #run
 shiny::shinyApp(ui, server)