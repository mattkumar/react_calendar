#Handle loading the calendar temploate and processing for either the shiny app or md
dec <- read_csv("www/data/dec.csv")

#Add in calendar dates of interest!
my_cal <- dec %>%
          mutate_if(is.numeric, as.character) %>%
  
          #Pay day - every Tuesday!
          mutate(Tuesday =  paste0('<p>',Tuesday,'</p>',
                                   '<p><img src="https://vignette.wikia.nocookie.net/newsupermariobrothers2/images/2/20/Coin.gif/revision/latest?cb=20120815171249"></img></p>')) %>%
        
          #Christmas
          mutate(Friday = ifelse(Friday == "25",paste0('<p>',Friday,'</p>',
                                                       '<p><img src="http://img1.joyreactor.com/pics/post/gif-christmas-tree-christmas-pixel-art-1003393.gif" height="75"></img></p>'),Friday)) %>%
 
          #End of 2020
          mutate(Thursday = ifelse(Thursday == "31",paste0('<p>',Thursday,'</p>',
                                                           '<p><img src="https://www.superluigibros.com/images/sprites/snes/allstars_smb3/Items/Super_Star_SMASSMB3.gif" height="22"></img><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/TheEnd.png" height="22"></img><img src="https://www.superluigibros.com/images/sprites/snes/allstars_smb3/Items/Super_Star_SMASSMB3.gif" height="22"></img></p>'),
                                                           Thursday)) %>%
            
          #Volunteering
          mutate(Saturday = ifelse(Saturday == "5", paste0('<p>',Saturday,'</p>', 
                                                           '<p style="color:red;font-size:12px">Volunteering</p>'), Saturday)) %>%

  
          #Secret Santa Gift Exchange
          mutate(Thursday = ifelse(Thursday == "10", paste0('<p>',Thursday,'</p>', 
                                                            '<p style="color:green;font-size:12px">Secret Santa</p>',
                                                            '<p><img src="https://www.superluigibros.com/images/sprites/nes/smb3/Items/CardRouletteSMB3.gif" height="40"></img></p>'), Thursday)) %>%
  
          #Oil Change
          mutate(Saturday = ifelse(Saturday == "12", paste0('<p>',Saturday,'</p>', 
                                                            '<p style="color:white;font-size:12px">Oil Change</p>',
                                                            '<p><img src="https://www.snesmaps.com/maps/SuperMarioKart/sprites/YoshiRotating.gif" height="40"></img></p>'), Saturday)) %>%

          #Work Location - In Office
          mutate(Monday = ifelse(Monday == "7", paste0('<p>',Monday,'</p>', 
                                                       '<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/MarioWalkingR.gif" height="25"></img></p>'), Monday))  %>%
 
          #Work Location - Working from home
          mutate(Monday = ifelse(Monday == "14", paste0('<p>',Monday,'</p>', 
                                                        '<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/LuigiWalkingR.gif" height="25"></img></p>'), Monday))   %>%
  
          mutate(Wednesday = ifelse(Wednesday == "2", paste0('<p>',Wednesday,'</p>', 
                                                             '<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/LuigiWalkingR.gif" height="25"></img></p>'), Wednesday))  %>%
  
          #Work Presentation
          mutate(Wednesday = ifelse(Wednesday == "16", paste0('<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/Rotodisc.gif" height="110"></img></p>'), Wednesday)) %>%
  
  
          #Dentist
          mutate(Sunday = ifelse(Sunday == "13", paste0('<p>',Sunday,'</p>',
                                                        '<p>','Dentist','</p>',
                                                        '<p><img src="https://www.superluigibros.com/images/sprites/nes/smb3/Enemies/Ani_smb3_chainchomp.gif" height="45"></img></p>'), Sunday)) %>%
          #Vacation Week off
          mutate(Monday = ifelse(Monday == "21", paste0('<p>',Monday,'</p>', 
                                                        '<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/MarioInvincibleR.gif" height="25"></img></p>'), Monday))  %>%
        
          #Vacation Week off
          mutate(Monday = ifelse(Monday == "28", paste0('<p>',Monday,'</p>', 
                                                        '<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/MarioInvincibleR.gif" height="25"></img></p>'), Monday)) %>%
  
  
          #Vacation Starts!
          mutate(Friday = ifelse(Friday == "18", paste0('<p>',Friday,'</p>', 
                                                        '<p style="color:yellow;font-size:12px">Vacation</p>',
                                                        '<p><img src="https://nesmaps.com/maps/SuperMarioBrothers3/sprites/MiniFortressBossWalking.gif" height="55"></img></p>'), Friday)) %>%
  
          #End of 2020
          mutate(Saturday = ifelse(Saturday == "26",paste0('<p>',Saturday,'</p>',
                                                           '<p><img src="  https://www.superluigibros.com/images/sprites/nes/smb3/Enemies/BusterBeetleSMB3.gif" height="45"></img><img src="https://www.superluigibros.com/images/sprites/nes/smb3/Enemies/BusterBeetleSMB3.gif" height="45"></img><img src="https://www.superluigibros.com/images/sprites/nes/smb3/Enemies/BusterBeetleSMB3.gif" height="45"></img></p>'),Saturday)) %>%
       
          #Christmas Eve Mass
          mutate(Thursday = ifelse(Thursday == "24", paste0('<p>',Thursday,'</p>', 
                                                            '<p style="color:green;font-size:12px">Mass</p>',
                                                            '<p><img src="https://www.superluigibros.com/images/sprites/snes/allstars_smb3/Map_Screen/Fortress2-SMB3.png" height="40"></img></p>'), Thursday)) %>%
  
          #Grandmas
          mutate(Sunday = ifelse(Sunday == "20", paste0('<p>',Sunday,'</p>',
                                                        '<p>','Grandmas','</p>',
                                                        '<p><img src="https://www.superluigibros.com/images/sprites/snes/allstars_smb3/Map_Screen/SMB3ToadHouses.png" height="30"></img></p>'), Sunday))  %>%
  
          #Concert
          mutate(Saturday = ifelse(Saturday == "19",paste0('<p>',Saturday,'</p>',
                                                           '<p>Concert</p>',
                                                           '<p><img src="https://www.superluigibros.com/images/sprites/nes/smb3/Items/Ani_smb3noteblock.gif" height="35"></img></p>'),Saturday))  %>%
    
   
          #Weekly Meetings
          mutate(Friday = ifelse(Friday %in% c('4','11'), paste0('<p>',Friday,'</p>', 
                                                                 '<p><img src="https://www.superluigibros.com/images/sprites/nes/smb3/Items/Big_Block_SMB3.png" height="65"></img></p>'),Friday))