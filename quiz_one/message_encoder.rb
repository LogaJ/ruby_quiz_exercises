require_relative 'prepare_message_for_encoding'

class EncodeMessage
  include PrepareMessageForEncoding

  def get_message
    original_message = []

    puts "Please enter your unencoded message."
    message = gets
    message.to_s.each_char do |char|
      original_message << char
    end

   prept_message = prepare_message_for_encoding original_message
  end
end

message = EncodeMessage.new
message.get_message
