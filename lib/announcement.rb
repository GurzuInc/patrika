require 'yaml'
require 'pry'
class Announcement
  attr_accessor :key, :secret
  def initialize
    config = YAML.load_file('config/configurations.yml')
    @key = config['trello']['key']
    @secret = config['trello']['secret']
  end
end
obj = Announcement.new

