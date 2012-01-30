class Cards
  attr_reader :deck

  def initialize
    @deck = (1..52).to_a + ['A','B']
  end

  def shift_card_in_deck card, offset
    last_card_index = (@deck.length) -1
    card_position = @deck.index card

    insert_position = card_position + offset
    insert_position -= last_card_index if insert_position > last_card_index

    @deck.slice!(card_position)
    @deck.insert(insert_position, card)
  end

  def triple_cut
    joker_a = @deck.find_index 'A'
    joker_b = @deck.find_index 'B'

    if joker_a < joker_b
      top_joker = joker_a
      bottom_joker = joker_b
    else
      top_joker = joker_b
      bottom_joker = joker_a
    end

    bottom_cards = @deck.slice!((bottom_joker+1)..(@deck.length-1))
    top_cards = []
    top_cards = @deck.slice!(0..(top_joker-1)) if top_joker > 0

    @deck = [bottom_cards, @deck, top_cards].flatten
  end
end

cards = Cards.new
cards.shift_card_in_deck 'A', 1
puts cards.deck.inspect

cards.shift_card_in_deck 'B', 2
puts cards.deck.inspect

cards.triple_cut
puts cards.deck.inspect
