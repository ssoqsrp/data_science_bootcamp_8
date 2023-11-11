# my first R program

pizzaid <- c(1, 2, 3, 4, 5)
pizzas <- c("Margherita", 
           "Hawaiian", 
           "Vegetarian", 
           "Pepperoni", 
           "BBQ Chicken")

price <- c(279, 379, 279, 279, 379)

menu <- data.frame(pizzaid, pizzas, price)

sizeid <- c(1, 2)
size <- c("Medium", "Large")

s_id <- data.frame(sizeid, size)



order <- function() {
  print("Hi this is The Pizza For You.")
  print("How may I help you?")
  print("Please answer in 'yes' or 'no'")
  
  while (TRUE) {
    chat1 <- readLines("stdin", n=1)
    if (chat1 == "yes"){
      print("What topping would you like?")
      print(menu)
      print("Plase should the topping with pizza ID")
    while (TRUE) {
       chat2 <- as.numeric(readLines("stdin", n=1))
     if (chat2 <= 5 ) {
       print(paste(pizzas[chat2], "pizza, what size please?"))
        total <- menu[chat2, 3]
        print(s_id)
        print("Please anwser 1 for medium or 2 for large")
        break
      } else if (chat2 > 5) {
      print("Sorry, we only have 1-5 ID on the menu")
    }
    }
     while (TRUE) {
        chat3 <- as.numeric(readLines("stdin", n=1))
        if (chat3 <= 1 ) {
          print("This is your order.")
          print(paste(pizzas[chat2], size[chat3], "size.", "total is", total, "THB, thank you enjoy your meal"))
          break
        } else if (chat3 == 2) {
          print("This is your order.")
          print(paste(pizzas[chat2], size[chat3], "size.", "total is", total+100, "THB, thank you enjoy your meal"))
          break
        } else if (chat3 > 2) {
          print("Sorry, we only have 2 size to choose from")
        }
      } 
      break
       }else if (chat1 == "no"){
      print("Thank you for your attention. Hope to see you soon.")
       break}
       else {
        print("Sorry, I don't understand you. Please try again..")
       }
      }
  }

