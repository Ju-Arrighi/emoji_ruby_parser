# frozen_string_literal: true

require_relative "emoji_ruby_parser/version"

require "json"

# This module provides methods for parsing and handling emoji characters.
# It includes functionalities like extracting emojis from text and potentially
# replacing them with their descriptions based on a provided emoji data source.
module EmojiRubyParser
  class Error < StandardError; end
  module_function

  EMOJI_REGEX = /\p{Emoji}+/u.freeze

  # Check if there is an emoji in the text string
  def emojis?(text)
    EMOJI_REGEX.match?(text)
  end

  # Split each emoji string into an array of characters
  def uniq_emojis(emojis_array)
    result = []

    emojis_array.each do |emojis|
      result << emojis.chars
    end
    result.flatten.uniq
  end

  def replace_emoji_with_text(text)
    return unless emojis?(text)

    emojis_array = text.scan(::EmojiRubyParser::EMOJI_REGEX)

    emojis = uniq_emojis(emojis_array)

    emoji_json = JSON.parse(File.read(File.absolute_path(File.dirname(__FILE__) + '/data/emoji.json')))

    parsed_text = text

    emojis.each do |moji|
      emoji_hash = emoji_json.find { |hash| hash["emoji"] == moji }

      parsed_text = parsed_text.gsub(moji, " #{emoji_hash ? emoji_hash["description"] : " "} ")
    end
    parsed_text
  end
end
