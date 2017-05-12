QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "Grabs the Player"

  field :all_players do
    type types[PlayerType]
    description 'All of the players'
    resolve -> (ob, args, ctx) { Player.all }
  end

  field :player do
    type PlayerType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Player.find(args[:id] )}
  end

  field :card do
    type CardType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Card.find(args[:id]) }
  end

  field :player_cards do
    type types[CardType]
    description 'All of the cards for a particular player'
    argument :player_id, !types.ID
    resolve -> (obj, args, cts) { Card.where(player_id: args[:player_id])}
  end

end

MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description "Mutation root"

  field :addPlayer, field: AddPlayerMutation.field
  field :addCard,   field: AddCardMutation.field
end

AddPlayerMutation = GraphQL::Relay::Mutation.define do
  name "AddPlayer"
  input_field :name, !types.String

  return_field :player, PlayerType
  resolve ->(object, inputs, ctx) {
    player = Player.create(name: inputs[:name])
    { player: player }
  }
end

AddCardMutation = GraphQL::Relay::Mutation.define do
  name "AddCard"
  input_field :player_id, !types.Int

  return_field :card, CardType
  resolve -> (object, inputs, ctx) {
    player = Player.find(inputs[:player_id])
    suits_count = Card::SUITS.length
    card = Card.create(player: player, suit: Card::SUITS[rand(suits_count)], card_number: rand(13) )
    { card: card }
  }
end

Schema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType
end