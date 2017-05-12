CardType = GraphQL::ObjectType.define do
  name 'Card'
  description 'A card in the deck'

  field :id, !types.ID
  field :suit, !types.String
  field :card_number, !types.Int
end