def say(msg)
	puts "=>#{msg}"
end

arr = [] 

card = 1

while card <= 13
	arr = arr << card
	card += 1
end

deck = arr * 4

say "Let's play Blackjack!"
say "Dealing..."


card1 = deck.sample
say "Your first card is #{card1}"
card2 = deck.sample
say "Your second card is #{card2}"
score = card1.to_i + card2.to_i
say "Your score is #{score}" 

while true
	if score == 21
		continue = false
		say 'You got Blackjack!'
	elsif score > 21
		continue = false
		say 'You busted! Dealer wins'
		break
	elsif score < 21
		say "What would you like to do? 1) Hit or 2) Stay"
		action = gets.chomp
		if action == '1'
			cardN = deck.sample
			say "Your next card is #{cardN}"
			score += cardN.to_i
			say "Your score is #{score}"
		elsif action == '2'
			say "Your score is #{score}"
			break
		end
	end
end