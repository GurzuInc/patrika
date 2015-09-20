require 'yaml'
require 'pry'
require 'dotenv'
CONFIG=Dotenv.load
class Announcement
  attr_accessor :key, :secret
  def initialize
    config = YAML.load_file('config/configurations.yml')
    @key = CONFIG['trello_key']
    @secret = CONFIG['trello_secret']
  end
end
obj = Announcement.new

