require_relative 'prepare_message_for_encoding'

class EncodeMessage
  include PrepareMessageForEncoding

  def encode_message
    original_message = []

    puts "Please enter your unencoded message."
    message = gets
    message.to_s.each_char do |char|
      original_message << char
    end

   prepare_message_for_encoding original_message
   puts @prept_message.inspect
  end
end

message = EncodeMessage.new
message.encode_message
