# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

my_hand = VALID_CARDS.sample(rand(2..5))

my_hand.each do |card|
  if ! (VALID_CARDS.include?(card))
    raise ArgumentError, "Invalid card"
  end
end

def blackjack_score(hand)
  score = 0

  if hand.include?("Jack")
    occur_jack = hand.count("Jack")
    hand.delete("Jack")
    hand << 10 * occur_jack
  end

  if hand.include?("Queen")
    occur_queen = hand.count("Queen")
    hand.delete("Queen")
    hand << 10 * occur_queen
  end

  if hand.include?("King")
    occur_king = hand.count("King")
    hand.delete("King")
    hand << 10 * occur_king
  end

  if hand.include?("Ace")
    occur_ace = hand.count("Ace")
    hand.delete("Ace")
    temp_score = hand.reduce(0, :+)

    if occur_ace == 1
      if (0..10) === temp_score # === include?
        hand << 11
      elsif (11..20) === temp_score
        hand << 1
      else
        raise ArgumentError, "Bust"
      end
    end

    if occur_ace == 2
      if (10..19) === temp_score
        hand << 2 #(1 + 1)
      elsif (0..9) === temp_score
        hand << 12 #(11 + 1)
      else
        raise ArgumentError, "Bust"
      end
    end

    if occur_ace == 3
      if (9..18) === temp_score
        hand << 3 # (1 + 1 + 1)
      elsif (0..8) === temp_score
        hand << 13 #(11 + 1 + 1)
      else
        raise ArgumentError, "Bust"
      end
    end

    if occur_ace == 4
      if (8..17) === temp_score
        hand << 4 #(1 + 1 + 1 + 1)
      elsif (0..7) === temp_score
        hand << 14 #(11 + 1 + 1 + 1)
      else
        raise ArgumentError, "Bust"
      end
    end
  end

  score = hand.reduce(0, :+)

  raise ArgumentError.new("Bust") if score > 21

  return score

end

blackjack_score(my_hand)

