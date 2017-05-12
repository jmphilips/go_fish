class Card < ApplicationRecord
  belongs_to :player
  SUITS = %W{\u{2660} \u{2661}  \u{2662} \u{2663}}

end
