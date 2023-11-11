## My second R program

pao_ying_chub <- function(){
  player_win <- 0
  bot_win <- 0
  tie <- 0
  
  rps <- c("rock", "paper", "scissors")
  r <- "rock"
  print("Hi, how are you")
  print("welcome to Rock Paper Scissors game")
  print("What's your name?")
  
  while(TRUE) {
    player_name <- readLines("stdin", n=1)
    if (player_name == ""){
      print ("Please insert your name!!")
    }
    else { print (paste("Hi!", player_name))
      break
      }
  }
    print ("Let's play the game")
    print ("input 'r' for Rock, 'p' for Paperm 's' for Scissors")
    print ("Quit game please input 'q")
    print ("3 2 1 shoot!!!!")
    
   while(TRUE) {
     player_shoot <- readLines("stdin", n=1)
     player_shoot <- tolower(player_shoot)
     if (player_shoot == "r") {
       player_shoot <- "Rock"
     } else if (player_shoot == "p") {
       player_shoot <- "Paper"
     } else if (player_shoot == "s") {
       player_shoot <- "Scissors"
     }
    
    bot_shoot <- sample(rps, 1)
      if (bot_shoot == "rock") {
        bot_shoot <- "Rock"
      } else if (bot_shoot == "paper") {
        bot_shoot <- "Paper"
      } else if (bot_shoot == "scissors") {
        bot_shoot <- "Scissors"
      }
    
    if (player_shoot == "q") {
      print(paste("You Win :", player_win))
      print(paste("Bot Win :", bot_win))
      print(paste("Tie", tie))
      print("See you again")
      break
    }
    if (player_shoot == bot_shoot){
      tie <- tie+1
      print("Tie")
    } else if (player_shoot == "Rock" & bot_shoot == "Scissors" |
               player_shoot == "Paper" & bot_shoot == "Rock" |
               player_shoot == "Scissors" & bot_shoot == "Paper")
    { player_shoot <- player_win +1
      print ("You Win!") 
    } else if (player_shoot == "Rock" & bot_shoot == "Paper" |
              player_shoot == "Paper" & bot_shoot == "Scissors" |
              player_shoot == "Scissors" & bot_shoot == "Rock")
    { bot_win <- bot_win + 1
    print("Bot win!")
    } else if (player_shoot == "") {
      print("Please insert a valid input")
    } else {
      print("Please insert a valid input")
    }
}
}
