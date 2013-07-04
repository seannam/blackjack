def say(msg)
	puts "=>#{msg}"
end

def win(player, dealer)
	if player > dealer && player <= 21 || dealer > 21
	
	elsif dealer == 21
		say "Dealer has blackjack! Dealer wins!"
	elsif player < dealer 
		say "Dealer wins!"
	elsif player == dealer
		say 'You push.'
	end
end

def face_value(l)
	if l == 'J' || l == 'Q' || l == 'K'
		value = 10
	elsif l == 'A'
		value = 11
		#value = 1
	elsif l == 2
		value = 2
	elsif l == 3
		value = 3
	elsif l == 4
		value = 4
	elsif l == 5
		value = 5
	elsif l == 6
		value = 6
	elsif l == 7
		value = 7
	elsif l == 8
		value = 8
	elsif l == 9
		value = 9
	elsif l == 10
		value = 10
	end
end

def ace(score)
	if score >= 11
		value = 1
	elsif score < 11
		value = 11
	end
end

arr = [] 

card = 1

while card <= 12
	arr = arr << card
	card += 1
end

arr[0] = 'A'
arr[10] = 'J'
arr[11] = 'Q'
arr[12] = 'K'

deck = arr * 4

say "Let's play Blackjack!"
play_again = true

while play_again

say "Dealing..."

card1 = deck.sample
say "Your first card is #{card1}" 
card2 = deck.sample
say "Your second card is #{card2}"

card1 = face_value(card1)
card2 = face_value(card2)

score = card1.to_i + card2.to_i

say "Your score is #{score}" 
cond = true
while cond
	if score == 21
		say 'You got Blackjack! You win!'
		break
	elsif score > 21
		say 'You busted! Dealer wins'
		break
	elsif score < 21
		say "What would you like to do? 1) Hit or 2) Stay"
		action = gets.chomp
		if action == '1'
			cardN = deck.sample
			say "Your next card is #{cardN}"
			cardN = face_value(cardN)
			score += cardN.to_i
			say "Your score is #{score}"
		elsif action == '2'
			say "Your score is #{score}"
			
			say "Now it's the dealer's turn"
			say "Note: Dealer stays at 17"
			dealer1 = deck.sample
			say "Dealer's first card is #{dealer1}"
			#say "#{dealer1}"
			dealer2 = deck.sample
			say "Dealer's second card is #{dealer2}"
			#say "#{dealer1}"
			dealer1 = face_value(dealer1)
			dealer2 = face_value(dealer2)
			dealer_score = dealer1.to_i + dealer2.to_i
			say "Dealer's score is #{dealer_score}"

			while dealer_score < 17
				dealer_next = deck.sample
				say "Dealer's next card is #{dealer_next}"
				#say "#{dealer_next}"
				dealer_next = face_value(dealer_next)
				dealer_score += dealer_next.to_i
				say "Dealer's score is #{dealer_score}"
				if dealer_score == 21
					say "Dealer got blackjack! You lose!"
					break
				elsif dealer_score > 21
						say "Dealer busts! You win!"	
				end
			end
			win(score, dealer_score)
			break
		end
	end
end

say "Play again? Y for yes, N for no"
answer = gets.chomp
	if answer.upcase == 'Y'
		play_again = true
		deck.shuffle
	elsif answer.upcase == 'N'
		play_again = false
		say 'Thank you for playing!'
		break
	end
end