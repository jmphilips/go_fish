PlayerType = GraphQL::ObjectType.define do
  name 'Player'
  description 'A player in the gofish game'

  field :id, !types.ID
  field :name, !types.String
end