require 'yaml'
require 'pry'
require 'dotenv'
require 'httparty'
CONFIG=Dotenv.load

class Announcement
  attr_accessor :key, :secret

  def initialize
    @key = CONFIG['trello_key']
    @secret = CONFIG['trello_secret']
  end

  def fetch_card
    list = HTTParty.get("https://api.trello.com/1/lists/55fe6d9b3eca2cb147724882?fields=name&cards=open&key=#{@key}")
    cards = list['cards']
    result = Array.new
    cards.each do |card|
      result << prepare_result(card)
    end
    return result
  end

  private
  def prepare_result(card)
    name = card['name']
    desc = card['desc']
    return {name: name, description: desc}
  end

  # Method to move published card from ready to publish to published list. This is not working now.
  def move_card(card)
    id = card['id']
    HTTParty.put("https://api.trello.com/1/cards/#{id}/55fe79ff6286c04f8ee97091&key=#{@key}")
  end
end
