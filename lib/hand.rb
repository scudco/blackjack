# frozen_string_literal: true

class Hand
  JACK = 'J'
  QUEEN = 'Q'
  KING = 'K'
  ACE = 'A'

  FACE_CARD_VALUE = 10
  FIRST_ACE_VALUE = 11
  ACE_VALUE = 1

  BONUS_HANDS = [
    [6, 7, 8],
    [7, 7, 7]
  ].freeze

  attr_reader :cards

  def initialize
    @cards = []
  end

  def deal(*cards)
    @cards += cards
  end

  def score
    card_values.sum
  end

  def blackjack?
    score == 21 && cards.length == 2
  end

  def bonus?
    BONUS_HANDS.include?(card_values.sort)
  end

  private

  def card_values
    cards.map { |card| value_for(card) }
  end

  def value_for(card)
    case card
    when ACE then ace_value
    when KING, QUEEN, JACK then FACE_CARD_VALUE
    else card
    end
  end

  def ace_value
    return ACE_VALUE if @ace_counted

    @ace_counted = true
    FIRST_ACE_VALUE
  end
end
