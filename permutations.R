# Monte Carlo simulation

# Create an urn with two reds and three blues
beads <- rep(c('red', 'blue'), times=c(2,3))
beads

# Take one bead at random
sample(beads, 1)

# Repeat the same task ten thousand times
B <- 10000
events <- replicate(B, sample(beads, 1))
# See the distribution using table
tab <- table(events)
tab
# see the proportion (theoretically 0.6 and 0.4)
prop.table(tab)

# We can do the same as replicate using the function sample with replacement
events2 <- sample(beads, B, replace = TRUE)


# Permutations

# Create a deck of 52 cards
suits <- c("Diamonds", "Hearts", "Clubs", "Spades")
numbers = c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number=numbers, suit=suits)
deck <- paste(deck$number, deck$suit)


# If you pick a card from the deck, what is the probability of getting a King?
kings <- paste("King", suits)
mean(deck %in% kings)

# To compute conditional probabilities we need permutations and
# combinations from gtools library

# Select two cards from the deck
hands <- permutations(52, 2, v = deck)
first_card <- hands[,1]
second_card <- hands[,2]

# In how many cases is the first card a king?
sum(first_card %in% kings)
# In how many cases are both cards kings?
sum(first_card %in% kings & second_card %in% kings) + sum(first_card %in% kings)
