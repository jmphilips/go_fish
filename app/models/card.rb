class Card < ApplicationRecord
  belongs_to :player
  SUITS = %W{\u{2660} \u{2661}  \u{2662} \u{2663}}

  def self.deal_hand(player_id)
    count = 0
    while count < 5
     create_unique_card(player_id)
     count += 1
    end
  end

  def self.create_unique_card(player_id)
    if Card.count < 52
      player = Player.find(player_id)
      suit        = random_suit
      card_number = random_number

      while !Card.find_by(card_number: card_number, suit: suit).nil?
        suit        = random_suit
        card_number = random_number
      end

      Card.create(suit: suit, card_number: card_number, player: player)
    end
  end

  def self.random_suit
    SUITS[rand(SUITS.length)]
  end

  def self.random_number
    rand(13)
  end

end
