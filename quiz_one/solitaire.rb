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

  def cut_count
    if @deck.last == 'A' || @deck.last == 'B'
      value_of_last_card = 3
    else
      value_of_last_card = @deck.last
    end

    cards_to_reinsert = @deck.slice!(0..(value_of_last_card-1))

    @deck.insert(-2, cards_to_reinsert).flatten!
  end

  def find_output_letter
    top_card_value = @deck.first
    return if is_a_string? top_card_value

    output_card_value = @deck[top_card_value]
    return if is_a_string? output_card_value

    amount_of_letters_in_alphabet = 26
    if output_card_value > amount_of_letters_in_alphabet
      output_cards_related_alphabet_value = output_card_value - amount_of_letters_in_alphabet
      output_card_value = output_cards_related_alphabet_value
    else
      output_card_value
    end

    alphabetized_output_card = (output_card_value + 9).to_s(36).upcase

    return alphabetized_output_card
  end

  private
  def is_a_string? card
    if (card.is_a?(String)) 
      puts "#{card} isn not a number." 
      return true
    end
    return nil
  end

end

cards = Cards.new
cards.shift_card_in_deck 'A', 1
puts cards.deck.inspect

cards.shift_card_in_deck 'B', 2
puts cards.deck.inspect

cards.triple_cut
puts cards.deck.inspect

cards.cut_count
puts cards.deck.inspect

puts cards.find_output_letter
puts cards.deck.inspect
