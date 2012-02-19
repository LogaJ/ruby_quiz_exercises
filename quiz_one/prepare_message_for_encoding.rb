module PrepareMessageForEncoding

  def prepare_message_for_encoding message
    disgard_invalid_chracters_from message
  end

  private
  def disgard_invalid_chracters_from message
    cleaned_message = []
    message.each do |char|
      cleaned_message << char[/[a-zA-Z]/]
    end
    cleaned_message.compact!

    upper_case_chracters_in cleaned_message
  end

  def upper_case_chracters_in message
    message = message.each { |char| char.upcase! }

    split_into_chracters_groups message
  end

  def split_into_chracters_groups message
    chracter_groups = []

    message.length.times do
      chracter_groups << message.first(5)
      message.slice!(0..4)
      if message.empty? 
        break
      end
    end 

    add_padding_to chracter_groups
  end

  def add_padding_to chracter_groups
    if chracter_groups.last.length < 5
      padding_amount = (5 - chracter_groups.last.length)

      padding_amount.times do
        chracter_groups.last << 'X'
      end

    end
    @prept_message = chracter_groups
  end
end
