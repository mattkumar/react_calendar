#Handle loading the calendar temploate and processing for either the shiny app or md
dec <- read_csv("www/data/dec.csv")

#Add in calendar dates of interest!
my_cal <- dec %>%
  mutate_if(is.numeric, as.character) %>%
  
  #Pay day - every Tuesday!
  mutate(Tuesday =  paste0('<p>',Tuesday,'</p>',
                           '<p><img src="img/coin.gif"></img></p>')) %>%
  
  #Christmas
  mutate(Friday = ifelse(Friday == "25",paste0('<p>',Friday,'</p>',
                                               '<p><img src="img/gif-christmas-tree-christmas-pixel-art-1003393.gif" height="75"></img></p>'),Friday)) %>%
  
  #End of 2020
  mutate(Thursday = ifelse(Thursday == "31",paste0('<p>',Thursday,'</p>',
                                                   '<p><img src="img/starcard.gif" height="22"></img><img src="img/TheEnd.png" height="22"></img><img src="img/starcard.gif" height="22"></img></p>'),
                           Thursday)) %>%
  
  #Volunteering
  mutate(Saturday = ifelse(Saturday == "5", paste0('<p>',Saturday,'</p>', 
                                                   '<p style="color:red;font-size:12px">Volunteering</p>'), Saturday)) %>%
  
  
  #Secret Santa Gift Exchange
  mutate(Thursday = ifelse(Thursday == "10", paste0('<p>',Thursday,'</p>', 
                                                    '<p style="color:green;font-size:12px">Secret Santa</p>',
                                                    '<p><img src="img/CardRouletteSMB3.gif" height="40"></img></p>'), Thursday)) %>%
  
  #Oil Change
  mutate(Saturday = ifelse(Saturday == "12", paste0('<p>',Saturday,'</p>', 
                                                    '<p style="color:white;font-size:12px">Oil Change</p>',
                                                    '<p><img src="img/YoshiRotating.gif" height="40"></img></p>'), Saturday)) %>%
  
  #Work Location - In Office
  mutate(Monday = ifelse(Monday == "7", paste0('<p>',Monday,'</p>', 
                                               '<p><img src="img/MarioWalkingR.gif" height="25"></img></p>'), Monday))  %>%
  
  #Work Location - Working from home
  mutate(Monday = ifelse(Monday == "14", paste0('<p>',Monday,'</p>', 
                                                '<p><img src="img/LuigiWalkingR.gif" height="25"></img></p>'), Monday))   %>%
  
  mutate(Wednesday = ifelse(Wednesday == "2", paste0('<p>',Wednesday,'</p>', 
                                                     '<p><img src="img/LuigiWalkingR.gif" height="25"></img></p>'), Wednesday))  %>%
  
  #Work Presentation
  mutate(Wednesday = ifelse(Wednesday == "16", paste0('<p><img src="img/Rotodisc.gif" height="110"></img></p>'), Wednesday)) %>%
  
  
  #Doctors!
  mutate(Wednesday = ifelse(Wednesday == "9", paste0('<p>',Wednesday,'</p>',
                                                     '<p style="color:lightblue;font-size:12px">Drs. Appt</p>',
                                                     '<p><img src="img/ani_drmario.gif" height="45"></img></p>'), Wednesday)) %>%
  
  #Skiing!
  mutate(Sunday = ifelse(Sunday %in% c("6","13","27"), paste0('<p>',Sunday,'</p>',
                                                               '<p style="color:lightblue;font-size:12px">Skiing</p>',
                                                               '<p><img src="img/skii.gif" height="50"></img></p>'), Sunday)) %>%
  #Vacation Week off
  mutate(Monday = ifelse(Monday == "21", paste0('<p>',Monday,'</p>', 
                                                '<p><img src="img/MarioInvincibleR.gif" height="25"></img></p>'), Monday))  %>%
  
  #Vacation Week off
  mutate(Monday = ifelse(Monday == "28", paste0('<p>',Monday,'</p>', 
                                                '<p><img src="img/MarioInvincibleR.gif" height="25"></img></p>'), Monday)) %>%
  
  
  #Vacation Starts!
  mutate(Friday = ifelse(Friday == "18", paste0('<p>',Friday,'</p>', 
                                                '<p style="color:lightblue;font-size:12px">Vacation</p>',
                                                '<p><img src="img/ani_smb3_boomboomfly.gif" height="55"></img></p>'), Friday)) %>%
  
  #End of 2020
  mutate(Saturday = ifelse(Saturday == "26",paste0('<p>',Saturday,'</p>',
                                                   '<p><img src="img/BusterBeetleSMB3.gif" height="45"></img><img src="img/BusterBeetleSMB3.gif" height="45"></img><img src="img/BusterBeetleSMB3.gif" height="45"></img></p>'),Saturday)) %>%
  
  #Christmas Eve Mass
  mutate(Thursday = ifelse(Thursday == "24", paste0('<p>',Thursday,'</p>', 
                                                    '<p style="color:lightred;font-size:12px">Mass</p>',
                                                    '<p><img src="img/Fortress2-SMB3.png" height="40"></img></p>'), Thursday)) %>%
  
  #Grandmas
  mutate(Sunday = ifelse(Sunday == "20", paste0('<p>',Sunday,'</p>',
                                                '<p style="color:lightblue;font-size:12px">Grandparents</p>',
                                                '<p><img src="img/SMB3ToadHouses.png" height="30"></img></p>'), Sunday))  %>%
  
  #Concert
  mutate(Saturday = ifelse(Saturday == "19",paste0('<p>',Saturday,'</p>',
                                                   '<p style="color:lightblue;font-size:12px">Concert</p>',
                                                   '<p><img src="img/Ani_smb3noteblock.gif" height="35"></img></p>'),Saturday))  %>%
  
  #Meetings
  mutate(Friday = ifelse(Friday %in% c("11","4") ,paste0('<p>',Friday,'</p>',
                                                         '<p><img src="img/FlyingQuestionBlock.gif" height="55"></img></p>'),Friday))  
  
   