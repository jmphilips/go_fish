class CardsController < ApplicationController
  def all_cards
    respond_with Card.all
  end
end